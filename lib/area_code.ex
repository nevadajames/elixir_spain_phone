defmodule AreaCode do
  @moduledoc """
  Returns map of provinces with corresponding area codes as a list
  """

  def codes_by_province do
    %{
    marbella: [822], badajoz: [ 824, 924], guipuzcoa: [843,943],
    navarra: [848, 948], granada: [858, 958], murcia: [868, 968], baleares: [871, 971],
    gerona: [872, 972], lerida: [ 873, 973], zaragoza: [876, 976],
    tarragona: [877, 977], pontevedra: [886, 986], madrid: [911, 912, 913, 914, 915, 916, 917, 918],
    segovia: [921], salamanca: [923], toledo: [925], ciudad_real: [926], caceres: [927],
    barcelona: [931, 932, 933, 934, 935, 936, 937, 938], la_rioja: [941], cantabria: [942],
    vizcaya: [944, 946], alava: [945], burgos: [947], guadalajara: [949], almeria: [950],
    malaga: [951, 952], jaen: [953], sevilla: [954, 955], cordoba: [957], huelva: [959],
    valencia: [960, 961, 962, 963], alicante: [965, 966],  albacete: [967], cuenca: [969],
    huesca: [974],  soria: [975], teruel: [978], palencia: [979], zamora: [980], lugo: [982],
    valladolid: [983], asturias: [984, 985], orense: [988]
    }
  end
end
