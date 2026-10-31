<Frame name="android / Shared specimens" x={520} y={2580} flex="col" w={364}>
  <Frame name="Layout / Počet kusov" flex="col" w="fill">
    <Text name="Text / Počet kusov" w="fill" color="#161D1C" font="Roboto" weight="medium" bind={{ "fills/0/color": "1074826698:36" }}>Počet kusov</Text>
    <Frame name="Space / 8" w={1} h={8} />
    <Frame name="Field / Počet kusov" flex="row" h={54} w="fill" items="center" p={15} bg="#FFFFFF" stroke="#6F7977" rounded={12} bind={{
      "fills/0/color": "1074826698:40",
      "strokes/0/color": "1074826698:43"
    }}>
      <Text name="Text / 8" grow={1} color="#161D1C" size={16} font="Roboto" bind={{ "fills/0/color": "1074826698:36" }}>8</Text>
    </Frame>
  </Frame>
  <Frame name="Space / 24" w={1} h={24} />
  <Frame name="Product / SM-001" flex="col" w="fill" p={16} bg="#FFFFFF" stroke="#BEC9C6" strokeWidth={0.6} rounded={20} bind={{
    "fills/0/color": "1074826698:40",
    "strokes/0/color": "1074826698:44"
  }}>
    <Frame name="Layout / Coffee beans 250 g" flex="row" w="fill" gap={14} items="center">
      <Frame name="Frame / Frame" flex="row" w={42} h={42} justify="center" items="center" bg="#9EF2E6" rounded={12} bind={{ "fills/0/color": "1074826698:33" }}>
        <Frame name="Icon / check" w={22} h={22}>
          <Frame name="Icon / Frame" w={22} h={22}>
            <Vector name="path" w={22} h={22} stroke="#147D73" strokeWidth={1.5583333333333331} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
          </Frame>
        </Frame>
      </Frame>
      <Frame name="Layout / Coffee beans 250 g" flex="col" grow={1}>
        <Text name="Text / Coffee beans 250 g" w="fill" color="#161D1C" font="Roboto" weight="medium" bind={{ "fills/0/color": "1074826698:36" }}>Coffee beans 250 g</Text>
        <Frame name="Space / 5" w={1} h={5} />
        <Text name="Text / SM-001 · Evidované: 12" w="fill" color="#161D1C" size={12} font="Roboto" bind={{ "fills/0/color": "1074826698:36" }}>SM-001 · Evidované: 12</Text>
      </Frame>
      <Text name="Text / 8" color="#161D1C" size={22} font="Roboto" weight={600} bind={{ "fills/0/color": "1074826698:36" }}>8</Text>
      <Frame name="Icon / chevron" w={18} h={18}>
        <Frame name="Icon / Frame" w={18} h={18}>
          <Vector name="path" w={18} h={18} stroke="#3F4947" strokeWidth={1.275} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
        </Frame>
      </Frame>
    </Frame>
  </Frame>
  <Frame name="Space / 20" w={1} h={20} />
  <Frame name="Status / Rozpracovaná" flex="row" py={6} px={10} bg="#9EF2E6" rounded={20} bind={{ "fills/0/color": "1074826698:33" }}>
    <Text name="Text / Rozpracovaná" color="#005049" size={12} font="Roboto" weight="medium" bind={{ "fills/0/color": "1074826698:34" }}>Rozpracovaná</Text>
  </Frame>
  <Frame name="Space / 12" w={1} h={12} />
  <Frame name="Status / Čaká na odoslanie" flex="row" py={6} px={10} bg="#CDE5FF" rounded={20} bind={{ "fills/0/color": "1074826698:41" }}>
    <Text name="Text / Čaká na odoslanie" color="#2E4961" size={12} font="Roboto" weight="medium" bind={{ "fills/0/color": "1074826698:42" }}>Čaká na odoslanie</Text>
  </Frame>
  <Frame name="Space / 12" w={1} h={12} />
  <Frame name="Status / Dokončená" flex="row" py={6} px={10} bg="#9EF2E6" rounded={20} bind={{ "fills/0/color": "1074826698:33" }}>
    <Text name="Text / Dokončená" color="#005049" size={12} font="Roboto" weight="medium" bind={{ "fills/0/color": "1074826698:34" }}>Dokončená</Text>
  </Frame>
  <Frame name="Space / 20" w={1} h={20} />
  <Frame name="Banner / Info" flex="row" w="fill" gap={10} p={16} bg="#9EF2E6" rounded={14} bind={{ "fills/0/color": "1074826698:33" }}>
    <Frame name="Icon / check" w={20} h={20}>
      <Frame name="Icon / Frame" w={20} h={20}>
        <Vector name="path" w={20} h={20} stroke="#005049" strokeWidth={1.4166666666666667} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
      </Frame>
    </Frame>
    <Text name="Text / Všetko je aktuálne" grow={1} color="#005049" font="Roboto" bind={{ "fills/0/color": "1074826698:34" }}>Všetko je aktuálne</Text>
  </Frame>
  <Frame name="Space / 12" w={1} h={12} />
  <Frame name="Banner / Warning" flex="row" w="fill" gap={10} p={16} bg="#FFDAD6" rounded={14} bind={{ "fills/0/color": "1074826698:46" }}>
    <Frame name="Icon / wifiOff" w={20} h={20}>
      <Frame name="Icon / Frame" w={20} h={20}>
        <Vector name="path" w={20} h={20} stroke="#93000A" strokeWidth={1.4166666666666667} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
      </Frame>
    </Frame>
    <Text name="Text / Uložená práca je v bezpečí." grow={1} color="#93000A" font="Roboto" bind={{ "fills/0/color": "1074826698:47" }}>Uložená práca je v bezpečí.</Text>
  </Frame>
</Frame>