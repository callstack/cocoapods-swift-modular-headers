require File.expand_path('../../spec_helper', __FILE__)

module Pod
  describe Command::Headers do
    describe 'CLAide' do
      it 'registers it self' do
        Command.parse(%w{ headers }).should.be.instance_of Command::Headers
      end
    end
  end
end

