class RodResponse
  attr_accessor :operation_programmee, :pris, :pris_eie, :instructeur, :operateurs, :operations, :name_operation, :code_opal

  def initialize(json, hma)
    @name_operation = ""
    @code_opal      = ""
    @operation_programmee = parse_operateur_programmee(json)
    @pris           = parse_pris(json)
    @pris_eie       = parse_pris_eie(json)
    @instructeur    = parse_instructeur(json)
    if !hma
      @operateurs     = parse_operateurs(json)
    else
      @operateurs     = parse_operateurs_hma(json)
    end
    @operations     = parse_operations(json)
  end

  def scheduled_operation?
    operations.count == 1 && operation_programmee
  end

private
  def create_or_update_intervenant!(role, attributes)
    clavis_service_id = attributes["id_clavis"]
    raison_sociale    = attributes["raison_sociale"]
    adresse_postale   = attributes["adresse_postale"].values.reject(&:blank?).join(' ')
    phone             = attributes["tel"]
    email             = attributes["email"]

    intervenant = Intervenant.find_by_clavis_service_id(clavis_service_id)
    if intervenant.blank?
      Intervenant.create! clavis_service_id: clavis_service_id, raison_sociale: raison_sociale, adresse_postale: adresse_postale, phone: phone, email: email, roles: [role]
    else
      intervenant.attributes = { raison_sociale: raison_sociale, adresse_postale: adresse_postale, phone: phone, email: email }
      intervenant.roles << role unless intervenant.roles.include? role
      intervenant.save!
      intervenant
    end
  end

  def parse_pris(json)
    create_or_update_intervenant!("pris", json["pris_anah"].first) rescue nil
  end

  def parse_pris_eie(json)
    create_or_update_intervenant!("pris", json["pris_eie"].first) rescue nil
  end

  def parse_instructeur(json)
    create_or_update_intervenant!("instructeur", json["service_instructeur"].first) rescue nil
  end

  def parse_operateur_programmee(json)
    count = 0
    if json["operation_programmee"].present?
      json["operation_programmee"].each do |op|
        count = count += 1
      end
    end
    return (count == 1)
  end

  def parse_operateurs(json)
    json_operateurs = json["operation_programmee"].present? ?
                      json["operation_programmee"].map { |op| op["operateurs"] }.flatten :
                      json["operateurs"]

    (json_operateurs || []).map { |attributes| create_or_update_intervenant!("operateur", attributes) }
  end

  def parse_operateurs_hma(json)
    ret = []
    if json["operation_programmee"].present? && json["operation_programmee"][0].present? && json["operation_programmee"][0]["operateurs"].present?
      ret = json["operation_programmee"].map { |op| op["operateurs"] }.flatten
    end
    if json["operateurs"].present?
      json["operateurs"].each do |op|
        bol = true
        ret.each do |r|
          if r['id_clavis'] == op['id_clavis']
            bol = false
          end
        end
        ret << op if bol
      end
    end
    (ret || []).map { |attributes| create_or_update_intervenant!("operateur", attributes) }
  end

  def parse_operations(json)
    if json["operation_programmee"].present?
      (json["operation_programmee"]).map do |attributes|
        @name_operation       = attributes["libelle"]
        @code_opal            = attributes["code_opal"]
        operateur_clavis_ids = attributes["operateurs"].map { |o| o["id_clavis"] }

        operateurs = Intervenant.where clavis_service_id: operateur_clavis_ids
        operation  = Operation.find_by_code_opal code_opal
        if operation.blank?
          Operation.create! name: name_operation, code_opal: code_opal, operateurs: operateurs
        else
          operation.update! name: name_operation, operateurs: operateurs
          operation
        end
      end
    else
      []
    end
  end

end

