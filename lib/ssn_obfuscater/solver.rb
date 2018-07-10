
module SsnObfuscater
  class Solver

    # AlgoService.new.parse
    def parse(args={})
      text = args.fetch(:text, nil)
      text = generate_ssn_num_strings if !text.present?
      result_hash = find_ssn_in_string(text)
      result_hash.is_a?(::Hash) ? result_hash : nil
      # safe_string_block = make_string_block_safe(result_hash, text)
    end


    # def parse_string_block(text)
    #   strings = text.split(/\.\s+|!|\?/)
    #   strings = strings.map { |str|  str.squeeze(' ') }
    #   strings = strings.map(&:strip)
    # end


    def find_ssn_in_string(string)
      result_hash = {}
      if string.present?
        ssn = string.scan(/\d{3}-\d{2}-\d{4}/).join(', ')
        if ssn.present?
          ssn_obf = obfuscate_ssn(ssn)
          string.gsub!(ssn, ssn_obf)
          result_hash = { ssn_alert: ssn.present?, ssn: ssn, ssn_obf: ssn_obf, safe_text: string }
        end
      end
      result_hash
    end


    # def make_string_block_safe(result_hashes, text)
    #   result_hashes.map do |hsh|
    #     ssn = hsh[:ssn]
    #     text.gsub!(ssn, hsh[:ssn_obf])
    #   end
    #   text
    # end


    # Obfuscate all Social Security Numbers. Example: XXX-XX-4430.
    def obfuscate_ssn(ssn)
      ssn_obf = "XXX-XX-#{ssn[-4..-1]}"
    end


    # SsnTool.generate_ssn_num_strings(5)
    def generate_ssn_num_strings(string_quantity)
      # fk_address = Faker::Address
      # fk_job = Faker::Job
      # fk_name = Faker::Name
      # fk_internet = Faker::Internet
      # fk_phone = Faker::PhoneNumber
      #
      # fake_profile_strings = (0..string_quantity).map do
      #   fk_name.name_with_middle
      #   full_name = fk_name.name_with_middle
      #   email_address = fk_internet.email(full_name)
      #   sample_ssn = "#{rand(329...889)}-#{rand(29...89)}-#{rand(2109...8989)}"
      #   sample_dob = "#{rand(1...12)}/#{rand(1...28)}/#{rand(1950...2010)}"
      #   address_meth_names = %w(street_address community city state_abbr zip)
      #   full_address = address_meth_names.map { |part| fk_address.module_eval(part) }.join(', ')
      #   job_meth_names = %w(field seniority position key_skill employment_type education_level)
      #   job_details = job_meth_names.map { |part| fk_job.module_eval(part) }.join(', ')
      #   string = [full_name, sample_dob, sample_ssn, email_address, fk_phone.cell_phone, full_address, job_details].join(', ')
      # end
      # string = fake_profile_strings.join(', ')

      "Dillan Richmond Gorczany, 8/16/1954, 000-12-3456, richmond.gorczany.dillan@jacobs.io, 405.226.5344, 2012 Erling Pass, Eagle Square, East Dwight, PA, 25733, Dynamic Manufacturing, VP of Tech"
    end

  end
end
