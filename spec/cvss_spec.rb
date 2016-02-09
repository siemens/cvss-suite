require 'spec_helper'

describe Cvss do

    let(:valid_cvss2) { Cvss.new('AV:N/AC:L/Au:N/C:P/I:P/A:P') }
    let(:valid_cvss2_temporal) { Cvss.new('AV:N/AC:L/Au:N/C:P/I:P/A:P/E:U/RL:OF/RC:C') }
    let(:valid_cvss2_environmental) { Cvss.new('AV:A/AC:M/Au:S/C:P/I:P/A:P/CDP:L/TD:M/CR:M/IR:M/AR:M') }
    let(:valid_cvss2_temporal_environmental) { Cvss.new('AV:A/AC:M/Au:S/C:P/I:P/A:P/E:POC/RL:TF/RC:UC/CDP:L/TD:M/CR:M/IR:M/AR:M') }
    let(:invalid_cvss2) { Cvss.new('AV:N/AC:P/C:P/AV:U/RL:OF/RC:C') }


    let(:valid_cvss3) { Cvss.new('CVSS:3.0/AV:L/AC:H/PR:L/UI:R/S:U/C:L/I:L/A:L/E:U/RL:W/RC:R') }
    let(:invalid_cvss3) { Cvss.new('CVSS:3.0/AV:L/AC:') }

    describe 'valid cvss2' do
      subject { valid_cvss2 }

      it { should be_valid }
      its(:version) { should eql(2) }
      its(:overall_score) { should eql(7.5) }
      its(:base_score) { should eql(7.5) }
    end

    describe 'valid cvss2 with temporal' do
      subject { valid_cvss2_temporal }

      it { should be_valid }
      its(:version) { should eql(2) }
      its(:overall_score) { should eql(5.5) }
      its(:base_score) { should eql(7.5) }
      its(:temporal_score) { should eql(5.5) }
    end

    describe 'valid cvss2 with environmental' do
      subject { valid_cvss2_environmental }

      it { should be_valid }
      its(:version) { should eql(2) }
      its(:overall_score) { should eql(4.1) }
      its(:base_score) { should eql(4.9) }
    end

    describe 'valid cvss2 with temporal and environmental' do
      subject { valid_cvss2_temporal_environmental }

      it { should be_valid }
      its(:version) { should eql(2) }
      its(:overall_score) { should eql(3.2) }
      its(:base_score) { should eql(4.9) }
      its(:temporal_score) { should eql(3.6) }
    end

    describe 'invalid cvss2' do
      subject { invalid_cvss2 }

      it { should_not be_valid }
      its(:version) { should eql(2) }
    end

    describe 'valid cvss3' do
      subject { valid_cvss3 }

      it { should be_valid }
      its(:version) { should eql(3) }
    end

    describe 'invalid cvss3' do
      subject { invalid_cvss3 }

      it { should_not be_valid }
      its(:version) { should eql(3) }
    end
end