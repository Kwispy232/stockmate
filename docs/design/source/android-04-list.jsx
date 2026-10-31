<Frame name="Inventúry / list" x={1560} y={140} w={412} h={924} bg="#F4F6F3" overflow="hidden" bind={{ "fills/0/color": "1074826698:35" }}>
  <Frame name="System / Status bar" w={412} h={24} bg="#F4F6F3" bind={{ "fills/0/color": "1074826698:35" }}>
    <Text name="Text / 9:41" x={18} y={4} color="#161D1C" size={12} font="Roboto" weight={600} bind={{ "fills/0/color": "1074826698:36" }}>9:41</Text>
    <Frame name="System / Frame" x={320} y={7} flex="row" w={72} h={14} gap={6} items="center">
      <Frame name="System / Signal strength" w={16} h={12}>
        <Frame name="Signal / bar 1" y={9} w={3} h={3} bg="#161D1C" rounded={1} bind={{ "fills/0/color": "1074826698:36" }} />
        <Frame name="Signal / bar 2" x={5} y={6} w={3} h={6} bg="#161D1C" rounded={1} bind={{ "fills/0/color": "1074826698:36" }} />
        <Frame name="Signal / bar 3" x={10} y={3} w={3} h={9} bg="#161D1C" rounded={1} bind={{ "fills/0/color": "1074826698:36" }} />
      </Frame>
      <Frame name="Icon / wifi" w={13} h={13}>
        <Frame name="Icon / Frame" w={13} h={13}>
          <Vector name="path" w={13} h={13} stroke="#161D1C" strokeWidth={0.9208333333333333} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
        </Frame>
      </Frame>
      <Frame name="Frame / Frame" w={22} h={10} bg="#161D1C" rounded={2} bind={{ "fills/0/color": "1074826698:36" }} />
    </Frame>
  </Frame>
  <Frame name="Layout / Inventúry" y={24} w={412} h={56}>
    <Frame name="Navigation / Inventúry" w={412} h={56} bg="#F4F6F3" bind={{ "fills/0/color": "1074826698:35" }}>
      <Text name="Text / Inventúry" x={16} y={15} w={340} h={28} color="#161D1C" size={20} font="Roboto" weight={600} textAutoResize="none" bind={{ "fills/0/color": "1074826698:36" }}>Inventúry</Text>
      <Frame name="Icon / gear" x={372} y={16} w={24} h={24}>
        <Frame name="Icon / Frame" w={24} h={24}>
          <Vector name="path" w={24} h={24} stroke="#161D1C" strokeWidth={1.7} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
          <Vector name="path" w={24} h={24} stroke="#161D1C" strokeWidth={1.7} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
        </Frame>
      </Frame>
    </Frame>
  </Frame>
  <Frame name="Content / scroll" x={24} y={104} flex="col" w={364}>
    <Frame name="Layout / Lokálne demo" flex="row" h={44} w="fill" gap={12} items="center">
      <Frame name="StockMate / Original SVG" w={44} h={44}>
        <Frame name="StockMate / Frame" w={44} h={44}>
          <Vector name="path" w={44} h={44} bg="#147D73" constraints={{ horizontal: "scale", vertical: "scale" }} />
          <Vector name="path" w={44} h={44} stroke="#FFFFFF" strokeWidth={1.8333333333333333} strokeAlign="center" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
          <Vector name="path" w={44} h={44} stroke="#FFFFFF" strokeWidth={1.8333333333333333} strokeAlign="center" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
          <Vector name="path" w={44} h={44} bg="#DFFFAB" constraints={{ horizontal: "scale", vertical: "scale" }} />
          <Vector name="path" w={44} h={44} stroke="#11564F" strokeWidth={1.8333333333333333} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
        </Frame>
      </Frame>
      <Text name="Text / Lokálne demo" grow={1} color="#161D1C" font="Roboto" weight="medium" bind={{ "fills/0/color": "1074826698:36" }}>Lokálne demo</Text>
      <Frame name="Icon / sync" w={24} h={24}>
        <Frame name="Icon / Frame" w={24} h={24}>
          <Vector name="path" w={24} h={24} stroke="#147D73" strokeWidth={1.7} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
        </Frame>
      </Frame>
    </Frame>
    <Frame name="Space / 24" w={1} h={24} />
    <Text name="Text / Zásoby pod kontrolou" w="fill" color="#161D1C" size={28} font="Roboto" weight="bold" letterSpacing={-0.7} bind={{ "fills/0/color": "1074826698:36" }}>Zásoby pod kontrolou</Text>
    <Frame name="Space / 8" w={1} h={8} />
    <Text name="Text / Malé počty. Jasné rozhodnutia." w="fill" color="#3F4947" size={16} font="Roboto" bind={{ "fills/0/color": "1074826698:37" }}>Malé počty. Jasné rozhodnutia.</Text>
    <Frame name="Space / 24" w={1} h={24} />
    <Frame name="Layout / 1" flex="row" w="fill" gap={12} items="center">
      <Frame name="Metric / Active" flex="col" grow={1} p={20} bg="#FFFFFF" stroke="#BEC9C6" strokeWidth={0.6} rounded={20} bind={{
        "fills/0/color": "1074826698:40",
        "strokes/0/color": "1074826698:44"
      }}>
        <Text name="Text / 1" color="#161D1C" size={32} font="Roboto" weight="bold" bind={{ "fills/0/color": "1074826698:36" }}>1</Text>
        <Frame name="Space / 4" w={1} h={4} />
        <Text name="Text / Rozpracované" color="#161D1C" font="Roboto" bind={{ "fills/0/color": "1074826698:36" }}>Rozpracované</Text>
      </Frame>
      <Frame name="Metric / Completed" flex="col" grow={1} p={20} bg="#FFFFFF" stroke="#BEC9C6" strokeWidth={0.6} rounded={20} bind={{
        "fills/0/color": "1074826698:40",
        "strokes/0/color": "1074826698:44"
      }}>
        <Text name="Text / 2" color="#161D1C" size={32} font="Roboto" weight="bold" bind={{ "fills/0/color": "1074826698:36" }}>2</Text>
        <Frame name="Space / 4" w={1} h={4} />
        <Text name="Text / Dokončené" color="#161D1C" font="Roboto" bind={{ "fills/0/color": "1074826698:36" }}>Dokončené</Text>
      </Frame>
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
    <Frame name="Space / 24" w={1} h={24} />
    <Frame name="ANDROID / Button / Primary / light" flex="row" h={52} w="fill" justify="center" items="center" bg="#147D73" rounded={14} bind={{ "fills/0/color": "1074826698:31" }}>
      <Text name="Text / Nová inventúra" color="#FFFFFF" font="Roboto" weight="medium" bind={{ "fills/0/color": "1074826698:32" }}>Nová inventúra</Text>
    </Frame>
    <Frame name="Space / 24" w={1} h={24} />
    <Frame name="Inventory card / Rozpracovaná" flex="col" w="fill" p={20} bg="#FFFFFF" stroke="#BEC9C6" strokeWidth={0.6} rounded={20} bind={{
      "fills/0/color": "1074826698:40",
      "strokes/0/color": "1074826698:44"
    }}>
      <Frame name="Layout / Bratislava · Centrum" flex="row" w="fill" gap={12} wrap items="center">
        <Text name="Text / Bratislava · Centrum" color="#161D1C" font="Roboto" weight="medium" bind={{ "fills/0/color": "1074826698:36" }}>Bratislava · Centrum</Text>
        <Frame name="Status / Rozpracovaná" flex="row" py={6} px={10} bg="#9EF2E6" rounded={20} bind={{ "fills/0/color": "1074826698:33" }}>
          <Text name="Text / Rozpracovaná" color="#005049" size={12} font="Roboto" weight="medium" bind={{ "fills/0/color": "1074826698:34" }}>Rozpracovaná</Text>
        </Frame>
      </Frame>
      <Frame name="Space / 14" w={1} h={14} />
      <Text name="Text / Ranná inventúra" w="fill" color="#161D1C" size={22} font="Roboto" weight={600} bind={{ "fills/0/color": "1074826698:36" }}>Ranná inventúra</Text>
      <Frame name="Space / 8" w={1} h={8} />
      <Text name="Text / 31. októbra 2026" color="#3F4947" size={12} font="Roboto" bind={{ "fills/0/color": "1074826698:37" }}>31. októbra 2026</Text>
      <Frame name="Space / 18" w={1} h={18} />
      <Frame name="Rule / Divider" w="fill" h={5} bg="#DDE4E1" bind={{ "fills/0/color": "1074826698:38" }}>
        <Frame name="Rule / Divider" w={129} h={5} bg="#147D73" bind={{ "fills/0/color": "1074826698:31" }} />
      </Frame>
      <Frame name="Space / 10" w={1} h={10} />
      <Text name="Text / Spočítané 12 z 30" color="#161D1C" font="Roboto" bind={{ "fills/0/color": "1074826698:36" }}>Spočítané 12 z 30</Text>
    </Frame>
    <Frame name="Space / 12" w={1} h={12} />
    <Frame name="Inventory card / Dokončená" flex="col" w="fill" p={20} bg="#FFFFFF" stroke="#BEC9C6" strokeWidth={0.6} rounded={20} bind={{
      "fills/0/color": "1074826698:40",
      "strokes/0/color": "1074826698:44"
    }}>
      <Frame name="Layout / Bratislava · Centrum" flex="row" w="fill" gap={12} wrap items="center">
        <Text name="Text / Bratislava · Centrum" color="#161D1C" font="Roboto" weight="medium" bind={{ "fills/0/color": "1074826698:36" }}>Bratislava · Centrum</Text>
        <Frame name="Status / Dokončená" flex="row" py={6} px={10} bg="#9EF2E6" rounded={20} bind={{ "fills/0/color": "1074826698:33" }}>
          <Text name="Text / Dokončená" color="#005049" size={12} font="Roboto" weight="medium" bind={{ "fills/0/color": "1074826698:34" }}>Dokončená</Text>
        </Frame>
      </Frame>
      <Frame name="Space / 14" w={1} h={14} />
      <Text name="Text / Večerná inventúra" w="fill" color="#161D1C" size={22} font="Roboto" weight={600} bind={{ "fills/0/color": "1074826698:36" }}>Večerná inventúra</Text>
      <Frame name="Space / 8" w={1} h={8} />
      <Text name="Text / 31. októbra 2026" color="#3F4947" size={12} font="Roboto" bind={{ "fills/0/color": "1074826698:37" }}>31. októbra 2026</Text>
      <Frame name="Space / 18" w={1} h={18} />
      <Frame name="Rule / Divider" w="fill" h={5} bg="#DDE4E1" bind={{ "fills/0/color": "1074826698:38" }}>
        <Frame name="Rule / Divider" w={324} h={5} bg="#147D73" bind={{ "fills/0/color": "1074826698:31" }} />
      </Frame>
      <Frame name="Space / 10" w={1} h={10} />
      <Text name="Text / Spočítané 30 z 30" color="#161D1C" font="Roboto" bind={{ "fills/0/color": "1074826698:36" }}>Spočítané 30 z 30</Text>
    </Frame>
  </Frame>
  <Frame name="Inventúry / Frame" y={896} w={412} h={28}>
    <Frame name="System / Gesture navigation" w={412} h={28}>
      <Frame name="Rule / Divider" x={156} y={13} w={100} h={4} bg="#3F4947" rounded={3} bind={{ "fills/0/color": "1074826698:37" }} />
    </Frame>
  </Frame>
</Frame>