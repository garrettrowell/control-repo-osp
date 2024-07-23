Facter.add(:test_end) do
  setcode do
    hostname = 'something-ssl-01c'
#    hostname = Facter.value('networking.hostname')
    s_metric = hostname.split('-').last
    s_metric.upcase
  end
end
