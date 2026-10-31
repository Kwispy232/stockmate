<Frame name="Inventúry / list" y={590} w={420} h={912} bg="#111B18" overflow="hidden" bind={{ "fills/0/color": "1074826698:16" }}>
  <Frame name="System / Status bar" w={420} h={59} bg="#111B18" bind={{ "fills/0/color": "1074826698:16" }}>
    <Text name="Text / 9:41" x={26} y={17} color="#DDE4E1" size={15} font="Helvetica Neue" weight="bold" bind={{ "fills/0/color": "1074826698:17" }}>9:41</Text>
    <Frame name="System / Frame" x={328} y={22} flex="row" w={72} h={14} gap={6} items="center">
      <Frame name="System / Signal strength" w={16} h={12}>
        <Frame name="Signal / bar 1" y={9} w={3} h={3} bg="#DDE4E1" rounded={1} bind={{ "fills/0/color": "1074826698:17" }} />
        <Frame name="Signal / bar 2" x={5} y={6} w={3} h={6} bg="#DDE4E1" rounded={1} bind={{ "fills/0/color": "1074826698:17" }} />
        <Frame name="Signal / bar 3" x={10} y={3} w={3} h={9} bg="#DDE4E1" rounded={1} bind={{ "fills/0/color": "1074826698:17" }} />
      </Frame>
      <Frame name="Icon / wifi" w={13} h={13}>
        <Frame name="Icon / Frame" w={13} h={13}>
          <Vector name="path" w={13} h={13} stroke="#DDE4E1" strokeWidth={0.9208333333333333} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
        </Frame>
      </Frame>
      <Frame name="Frame / Frame" w={22} h={10} bg="#DDE4E1" rounded={2} bind={{ "fills/0/color": "1074826698:17" }} />
    </Frame>
  </Frame>
  <Frame name="Layout / Inventúry" y={59} w={420} h={44}>
    <Frame name="Navigation / Inventúry" w={420} h={44} bg="#111B18" bind={{ "fills/0/color": "1074826698:16" }}>
      <Text name="Text / Inventúry" x={86} y={12} w={248} h={24} color="#DDE4E1" size={17} font="Helvetica Neue" weight="bold" textAlign="center" textAutoResize="none" bind={{ "fills/0/color": "1074826698:17" }}>Inventúry</Text>
      <Frame name="Icon / gear" x={380} y={11} w={24} h={24}>
        <Frame name="Icon / Frame" w={24} h={24}>
          <Vector name="path" w={24} h={24} stroke="#8DD8C5" strokeWidth={1.7} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
          <Vector name="path" w={24} h={24} stroke="#8DD8C5" strokeWidth={1.7} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
        </Frame>
      </Frame>
      <Frame name="Rule / Divider" y={43} w={420} h={1} bg="#3F4947" bind={{ "fills/0/color": "1074826698:25" }} />
    </Frame>
  </Frame>
  <Frame name="Content / scroll" x={24} y={127} flex="col" w={372}>
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
      <Text name="Text / Lokálne demo" grow={1} color="#DDE4E1" font="Helvetica Neue" weight="medium" bind={{ "fills/0/color": "1074826698:17" }}>Lokálne demo</Text>
    </Frame>
    <Frame name="Space / 24" w={1} h={24} />
    <Frame name="Layout / 1" flex="row" w="fill" gap={12} items="center">
      <Frame name="Metric / Active" flex="col" grow={1} p={20} bg="#090F0E" stroke="#3F4947" strokeWidth={0.6} rounded={20} bind={{
        "fills/0/color": "1074826698:21",
        "strokes/0/color": "1074826698:25"
      }}>
        <Text name="Text / 1" color="#DDE4E1" size={32} font="Helvetica Neue" weight="bold" bind={{ "fills/0/color": "1074826698:17" }}>1</Text>
        <Frame name="Space / 4" w={1} h={4} />
        <Text name="Text / Rozpracované" color="#DDE4E1" font="Helvetica Neue" bind={{ "fills/0/color": "1074826698:17" }}>Rozpracované</Text>
      </Frame>
      <Frame name="Metric / Completed" flex="col" grow={1} p={20} bg="#090F0E" stroke="#3F4947" strokeWidth={0.6} rounded={20} bind={{
        "fills/0/color": "1074826698:21",
        "strokes/0/color": "1074826698:25"
      }}>
        <Text name="Text / 2" color="#DDE4E1" size={32} font="Helvetica Neue" weight="bold" bind={{ "fills/0/color": "1074826698:17" }}>2</Text>
        <Frame name="Space / 4" w={1} h={4} />
        <Text name="Text / Dokončené" color="#DDE4E1" font="Helvetica Neue" bind={{ "fills/0/color": "1074826698:17" }}>Dokončené</Text>
      </Frame>
    </Frame>
    <Frame name="Space / 20" w={1} h={20} />
    <Frame name="Banner / Info" flex="row" w="fill" gap={10} p={16} bg="#005049" rounded={14} bind={{ "fills/0/color": "1074826698:14" }}>
      <Frame name="Icon / check" w={20} h={20}>
        <Frame name="Icon / Frame" w={20} h={20}>
          <Vector name="path" w={20} h={20} stroke="#9EF2E6" strokeWidth={1.4166666666666667} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
        </Frame>
      </Frame>
      <Text name="Text / Všetko je aktuálne" grow={1} color="#9EF2E6" font="Helvetica Neue" bind={{ "fills/0/color": "1074826698:15" }}>Všetko je aktuálne</Text>
    </Frame>
    <Frame name="Space / 24" w={1} h={24} />
    <Frame name="IOS / Button / Primary / dark" flex="row" h={52} w="fill" justify="center" items="center" bg="#8DD8C5" rounded={14} bind={{ "fills/0/color": "1074826698:12" }}>
      <Text name="Text / Nová inventúra" color="#003732" size={17} font="Helvetica Neue" weight="medium" bind={{ "fills/0/color": "1074826698:13" }}>Nová inventúra</Text>
    </Frame>
    <Frame name="Space / 24" w={1} h={24} />
    <Frame name="Inventory card / Rozpracovaná" flex="col" w="fill" p={20} bg="#090F0E" stroke="#3F4947" strokeWidth={0.6} rounded={20} bind={{
      "fills/0/color": "1074826698:21",
      "strokes/0/color": "1074826698:25"
    }}>
      <Frame name="Layout / Bratislava · Centrum" flex="row" w="fill" gap={12} wrap items="center">
        <Text name="Text / Bratislava · Centrum" color="#DDE4E1" font="Helvetica Neue" weight="medium" bind={{ "fills/0/color": "1074826698:17" }}>Bratislava · Centrum</Text>
        <Frame name="Status / Rozpracovaná" flex="row" py={6} px={10} bg="#005049" rounded={20} bind={{ "fills/0/color": "1074826698:14" }}>
          <Text name="Text / Rozpracovaná" color="#9EF2E6" size={12} font="Helvetica Neue" weight="medium" bind={{ "fills/0/color": "1074826698:15" }}>Rozpracovaná</Text>
        </Frame>
      </Frame>
      <Frame name="Space / 14" w={1} h={14} />
      <Text name="Text / Ranná inventúra" w="fill" color="#DDE4E1" size={22} font="Helvetica Neue" weight="bold" bind={{ "fills/0/color": "1074826698:17" }}>Ranná inventúra</Text>
      <Frame name="Space / 8" w={1} h={8} />
      <Text name="Text / 31. októbra 2026" color="#BEC9C6" size={12} font="Helvetica Neue" bind={{ "fills/0/color": "1074826698:18" }}>31. októbra 2026</Text>
      <Frame name="Space / 18" w={1} h={18} />
      <Frame name="Rule / Divider" w="fill" h={5} bg="#303635" bind={{ "fills/0/color": "1074826698:19" }}>
        <Frame name="Rule / Divider" w={132} h={5} bg="#8DD8C5" bind={{ "fills/0/color": "1074826698:12" }} />
      </Frame>
      <Frame name="Space / 10" w={1} h={10} />
      <Text name="Text / Spočítané 12 z 30" color="#DDE4E1" font="Helvetica Neue" bind={{ "fills/0/color": "1074826698:17" }}>Spočítané 12 z 30</Text>
    </Frame>
    <Frame name="Space / 12" w={1} h={12} />
    <Frame name="Inventory card / Dokončená" flex="col" w="fill" p={20} bg="#090F0E" stroke="#3F4947" strokeWidth={0.6} rounded={20} bind={{
      "fills/0/color": "1074826698:21",
      "strokes/0/color": "1074826698:25"
    }}>
      <Frame name="Layout / Bratislava · Centrum" flex="row" w="fill" gap={12} wrap items="center">
        <Text name="Text / Bratislava · Centrum" color="#DDE4E1" font="Helvetica Neue" weight="medium" bind={{ "fills/0/color": "1074826698:17" }}>Bratislava · Centrum</Text>
        <Frame name="Status / Dokončená" flex="row" py={6} px={10} bg="#005049" rounded={20} bind={{ "fills/0/color": "1074826698:14" }}>
          <Text name="Text / Dokončená" color="#9EF2E6" size={12} font="Helvetica Neue" weight="medium" bind={{ "fills/0/color": "1074826698:15" }}>Dokončená</Text>
        </Frame>
      </Frame>
      <Frame name="Space / 14" w={1} h={14} />
      <Text name="Text / Večerná inventúra" w="fill" color="#DDE4E1" size={22} font="Helvetica Neue" weight="bold" bind={{ "fills/0/color": "1074826698:17" }}>Večerná inventúra</Text>
      <Frame name="Space / 8" w={1} h={8} />
      <Text name="Text / 31. októbra 2026" color="#BEC9C6" size={12} font="Helvetica Neue" bind={{ "fills/0/color": "1074826698:18" }}>31. októbra 2026</Text>
      <Frame name="Space / 18" w={1} h={18} />
      <Frame name="Rule / Divider" w="fill" h={5} bg="#303635" bind={{ "fills/0/color": "1074826698:19" }}>
        <Frame name="Rule / Divider" w={332} h={5} bg="#8DD8C5" bind={{ "fills/0/color": "1074826698:12" }} />
      </Frame>
      <Frame name="Space / 10" w={1} h={10} />
      <Text name="Text / Spočítané 30 z 30" color="#DDE4E1" font="Helvetica Neue" bind={{ "fills/0/color": "1074826698:17" }}>Spočítané 30 z 30</Text>
    </Frame>
  </Frame>
  <Frame name="Inventúry / Frame" y={878} w={420} h={34}>
    <Frame name="System / Home indicator" w={420} h={34}>
      <Frame name="Rule / Divider" x={143} y={20} w={134} h={5} bg="#DDE4E1" rounded={3} bind={{ "fills/0/color": "1074826698:17" }} />
    </Frame>
  </Frame>
</Frame>