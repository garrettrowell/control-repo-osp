Facter.add(:cust_app) do
  setcode do
    hostname = 'something-ssl-01'
#    hostname = Facter.value('networking.hostname')
    case hostname
    when /^.*-(ssl|SSL).*/
      'ssl'
    else
      nil
    end
  end
end
