<Frame name="Inventúry / empty" x={1040} y={140} w={420} h={912} bg="#F4F6F3" overflow="hidden" bind={{ "fills/0/color": "1074826698:35" }}>
  <Frame name="System / Status bar" w={420} h={59} bg="#F4F6F3" bind={{ "fills/0/color": "1074826698:35" }}>
    <Text name="Text / 9:41" x={26} y={17} color="#161D1C" size={15} font="Helvetica Neue" weight="bold" bind={{ "fills/0/color": "1074826698:36" }}>9:41</Text>
    <Frame name="System / Frame" x={328} y={22} flex="row" w={72} h={14} gap={6} items="center">
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
  <Frame name="Layout / Inventúry" y={59} w={420} h={44}>
    <Frame name="Navigation / Inventúry" w={420} h={44} bg="#F4F6F3" bind={{ "fills/0/color": "1074826698:35" }}>
      <Text name="Text / Inventúry" x={86} y={12} w={248} h={24} color="#161D1C" size={17} font="Helvetica Neue" weight="bold" textAlign="center" textAutoResize="none" bind={{ "fills/0/color": "1074826698:36" }}>Inventúry</Text>
      <Frame name="Icon / gear" x={380} y={11} w={24} h={24}>
        <Frame name="Icon / Frame" w={24} h={24}>
          <Vector name="path" w={24} h={24} stroke="#147D73" strokeWidth={1.7} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
          <Vector name="path" w={24} h={24} stroke="#147D73" strokeWidth={1.7} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
        </Frame>
      </Frame>
      <Frame name="Rule / Divider" y={43} w={420} h={1} bg="#BEC9C6" bind={{ "fills/0/color": "1074826698:44" }} />
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
      <Text name="Text / Lokálne demo" grow={1} color="#161D1C" font="Helvetica Neue" weight="medium" bind={{ "fills/0/color": "1074826698:36" }}>Lokálne demo</Text>
      <Frame name="Icon / sync" w={24} h={24}>
        <Frame name="Icon / Frame" w={24} h={24}>
          <Vector name="path" w={24} h={24} stroke="#147D73" strokeWidth={1.7} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
        </Frame>
      </Frame>
    </Frame>
    <Frame name="Space / 24" w={1} h={24} />
    <Text name="Text / Zásoby pod kontrolou" w="fill" color="#161D1C" size={28} font="Helvetica Neue" weight="bold" letterSpacing={-0.7} bind={{ "fills/0/color": "1074826698:36" }}>Zásoby pod kontrolou</Text>
    <Frame name="Space / 8" w={1} h={8} />
    <Text name="Text / Malé počty. Jasné rozhodnutia." w="fill" color="#3F4947" size={16} font="Helvetica Neue" bind={{ "fills/0/color": "1074826698:37" }}>Malé počty. Jasné rozhodnutia.</Text>
    <Frame name="Space / 24" w={1} h={24} />
    <Frame name="Layout / 0" flex="row" w="fill" gap={12} items="center">
      <Frame name="Metric / Active" flex="col" grow={1} p={20} bg="#FFFFFF" stroke="#BEC9C6" strokeWidth={0.6} rounded={20} bind={{
        "fills/0/color": "1074826698:40",
        "strokes/0/color": "1074826698:44"
      }}>
        <Text name="Text / 0" color="#161D1C" size={32} font="Helvetica Neue" weight="bold" bind={{ "fills/0/color": "1074826698:36" }}>0</Text>
        <Frame name="Space / 4" w={1} h={4} />
        <Text name="Text / Rozpracované" color="#161D1C" font="Helvetica Neue" bind={{ "fills/0/color": "1074826698:36" }}>Rozpracované</Text>
      </Frame>
      <Frame name="Metric / Completed" flex="col" grow={1} p={20} bg="#FFFFFF" stroke="#BEC9C6" strokeWidth={0.6} rounded={20} bind={{
        "fills/0/color": "1074826698:40",
        "strokes/0/color": "1074826698:44"
      }}>
        <Text name="Text / 0" color="#161D1C" size={32} font="Helvetica Neue" weight="bold" bind={{ "fills/0/color": "1074826698:36" }}>0</Text>
        <Frame name="Space / 4" w={1} h={4} />
        <Text name="Text / Dokončené" color="#161D1C" font="Helvetica Neue" bind={{ "fills/0/color": "1074826698:36" }}>Dokončené</Text>
      </Frame>
    </Frame>
    <Frame name="Space / 20" w={1} h={20} />
    <Frame name="Banner / Info" flex="row" w="fill" gap={10} p={16} bg="#9EF2E6" rounded={14} bind={{ "fills/0/color": "1074826698:33" }}>
      <Frame name="Icon / check" w={20} h={20}>
        <Frame name="Icon / Frame" w={20} h={20}>
          <Vector name="path" w={20} h={20} stroke="#005049" strokeWidth={1.4166666666666667} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
        </Frame>
      </Frame>
      <Text name="Text / Všetko je aktuálne" grow={1} color="#005049" font="Helvetica Neue" bind={{ "fills/0/color": "1074826698:34" }}>Všetko je aktuálne</Text>
    </Frame>
    <Frame name="Space / 24" w={1} h={24} />
    <Frame name="iOS / Button / Primary" flex="row" h={52} w="fill" justify="center" items="center" bg="#147D73" rounded={14} bind={{ "fills/0/color": "1074826698:31" }}>
      <Text name="Text / Nová inventúra" color="#FFFFFF" size={17} font="Helvetica Neue" weight="medium">Nová inventúra</Text>
    </Frame>
    <Frame name="Space / 24" w={1} h={24} />
    <Frame name="Empty state" flex="col" w="fill" p={20} bg="#FFFFFF" stroke="#BEC9C6" strokeWidth={0.6} rounded={20} bind={{
      "fills/0/color": "1074826698:40",
      "strokes/0/color": "1074826698:44"
    }}>
      <Frame name="Empty state / Frame" flex="row" h={72} w="fill" justify="center">
        <Frame name="StockMate / Original SVG" w={72} h={72}>
          <Frame name="StockMate / Frame" w={72} h={72}>
            <Vector name="path" w={72} h={72} bg="#147D73" constraints={{ horizontal: "scale", vertical: "scale" }} />
            <Vector name="path" w={72} h={72} stroke="#FFFFFF" strokeWidth={3} strokeAlign="center" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
            <Vector name="path" w={72} h={72} stroke="#FFFFFF" strokeWidth={3} strokeAlign="center" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
            <Vector name="path" w={72} h={72} bg="#DFFFAB" constraints={{ horizontal: "scale", vertical: "scale" }} />
            <Vector name="path" w={72} h={72} stroke="#11564F" strokeWidth={3} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
          </Frame>
        </Frame>
      </Frame>
      <Frame name="Space / 24" w={1} h={24} />
      <Text name="Text / Pripravený na prvé počítanie?" w="fill" color="#161D1C" size={22} font="Helvetica Neue" textAlign="center" bind={{ "fills/0/color": "1074826698:36" }}>Pripravený na prvé počítanie?</Text>
      <Frame name="Space / 10" w={1} h={10} />
      <Text name="Text / Vyber predajňu, spočítaj zásoby a zvyšok nechaj " w="fill" color="#3F4947" font="Helvetica Neue" textAlign="center" bind={{ "fills/0/color": "1074826698:37" }}>Vyber predajňu, spočítaj zásoby a zvyšok nechaj na StockMate.</Text>
    </Frame>
  </Frame>
  <Frame name="Inventúry / Frame" y={878} w={420} h={34}>
    <Frame name="System / Home indicator" w={420} h={34}>
      <Frame name="Rule / Divider" x={143} y={20} w={134} h={5} bg="#161D1C" rounded={3} bind={{ "fills/0/color": "1074826698:36" }} />
    </Frame>
  </Frame>
</Frame>