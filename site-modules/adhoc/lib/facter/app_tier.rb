Facter.add(:app_tier) do
  setcode do
    certname = Facter.value('networking.hostname')
    certname
  end
end
