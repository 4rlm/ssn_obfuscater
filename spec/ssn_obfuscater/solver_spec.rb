# rspec spec/ssn_obfuscater/solver_spec.rb

require 'spec_helper'

describe 'Solver' do
  let(:solver_obj) { SsnObfuscater::Solver.new }
  # before { solver_obj.inst = inst }

  describe '#parse' do
    let(:args) do
      {
        text:         'Dillan Richmond Gorczany, 8/16/1954, 000-12-3456, richmond.gorczany.dillan@jacobs.io, 405.226.5344, 2012 Erling Pass, Eagle Square, East Dwight, PA, 25733, Dynamic Manufacturing, VP of Tech'
      }
    end
    let(:result_hash) do
      { ssn_alert: true,
        ssn: '000-12-3456',
        ssn_obf: 'XXX-XX-3456',
        safe_text:   'Dillan Richmond Gorczany, 8/16/1954, XXX-XX-3456, richmond.gorczany.dillan@jacobs.io, 405.226.5344, 2012 Erling Pass, Eagle Square, East Dwight, PA, 25733, Dynamic Manufacturing, VP of Tech' }
    end

    it 'parse' do
      expect(solver_obj.parse(args)).to eql(result_hash)
    end
  end

  describe '#find_ssn_in_string' do
    let(:string) do
      'Dillan Richmond Gorczany, 8/16/1954, 000-12-3456, richmond.gorczany.dillan@jacobs.io, 405.226.5344, 2012 Erling Pass, Eagle Square, East Dwight, PA, 25733, Dynamic Manufacturing, VP of Tech'
    end
    let(:result_hash) do
      { ssn_alert: true,
        ssn: '000-12-3456',
        ssn_obf: 'XXX-XX-3456',
        safe_text:   'Dillan Richmond Gorczany, 8/16/1954, XXX-XX-3456, richmond.gorczany.dillan@jacobs.io, 405.226.5344, 2012 Erling Pass, Eagle Square, East Dwight, PA, 25733, Dynamic Manufacturing, VP of Tech' }
    end

    it 'find_ssn_in_string' do
      expect(solver_obj.find_ssn_in_string(string)).to eql(result_hash)
    end
  end

  describe '#obfuscate_ssn' do
    let(:ssn) { '000-12-3456' }
    let(:ssn_obf) { 'XXX-XX-3456' }

    it 'obfuscate_ssn' do
      expect(solver_obj.obfuscate_ssn(ssn)).to eql(ssn_obf)
    end
  end

  describe '#generate_ssn_num_strings' do
    let(:string_quantity) { 1 }
    let(:string) do
      "Dillan Richmond Gorczany, 8/16/1954, 000-12-3456, richmond.gorczany.dillan@jacobs.io, 405.226.5344, 2012 Erling Pass, Eagle Square, East Dwight, PA, 25733, Dynamic Manufacturing, VP of Tech"
    end

    it 'generate_ssn_num_strings' do
      expect(solver_obj.generate_ssn_num_strings(string_quantity)).to eql(string)
    end
  end
end
