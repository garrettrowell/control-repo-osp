Facter.add(:app_tier) do
  setcode do
    certname = Facter.value('trusted')['certname']
    certname
  end
end
