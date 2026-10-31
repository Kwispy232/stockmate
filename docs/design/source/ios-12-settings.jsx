<Frame name="12 · Nastavenia" x={2600} y={1240} w={420} h={912} bg="#F4F6F3" overflow="hidden" bind={{ "fills/0/color": "1074826698:35" }}>
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
  <Frame name="Layout / Nastavenia" y={59} w={420} h={44}>
    <Frame name="Navigation / Nastavenia" w={420} h={44} bg="#F4F6F3" bind={{ "fills/0/color": "1074826698:35" }}>
      <Text name="Text / Nastavenia" x={86} y={12} w={248} h={24} color="#161D1C" size={17} font="Helvetica Neue" weight="bold" textAlign="center" textAutoResize="none" bind={{ "fills/0/color": "1074826698:36" }}>Nastavenia</Text>
      <Frame name="Layout / Späť" x={8} y={9} flex="row" w={78} h={30} items="center">
        <Frame name="Icon / back" w={22} h={22}>
          <Frame name="Icon / Frame" w={22} h={22}>
            <Vector name="path" w={22} h={22} stroke="#147D73" strokeWidth={1.5583333333333331} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
          </Frame>
        </Frame>
        <Text name="Text / Späť" color="#147D73" size={17} font="Helvetica Neue" bind={{ "fills/0/color": "1074826698:31" }}>Späť</Text>
      </Frame>
      <Frame name="Rule / Divider" y={43} w={420} h={1} bg="#BEC9C6" bind={{ "fills/0/color": "1074826698:44" }} />
    </Frame>
  </Frame>
  <Frame name="Content / scroll" x={24} y={127} flex="col" w={372}>
    <Frame name="Layout / Lokálne demo" flex="col" w="fill" p={20} bg="#FFFFFF" stroke="#BEC9C6" strokeWidth={0.6} rounded={20} bind={{
      "fills/0/color": "1074826698:40",
      "strokes/0/color": "1074826698:44"
    }}>
      <Frame name="Layout / Lokálne demo" flex="row" w="fill" gap={16} items="center">
        <Frame name="StockMate / Original SVG" w={48} h={48}>
          <Frame name="StockMate / Frame" w={48} h={48}>
            <Vector name="path" w={48} h={48} bg="#147D73" constraints={{ horizontal: "scale", vertical: "scale" }} />
            <Vector name="path" w={48} h={48} stroke="#FFFFFF" strokeWidth={2} strokeAlign="center" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
            <Vector name="path" w={48} h={48} stroke="#FFFFFF" strokeWidth={2} strokeAlign="center" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
            <Vector name="path" w={48} h={48} bg="#DFFFAB" constraints={{ horizontal: "scale", vertical: "scale" }} />
            <Vector name="path" w={48} h={48} stroke="#11564F" strokeWidth={2} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
          </Frame>
        </Frame>
        <Frame name="Layout / Lokálne demo" flex="col" grow={1}>
          <Text name="Text / Lokálne demo" w="fill" color="#161D1C" size={16} font="Helvetica Neue" weight="medium" bind={{ "fills/0/color": "1074826698:36" }}>Lokálne demo</Text>
          <Frame name="Space / 6" w={1} h={6} />
          <Text name="Text / Ukážkové údaje zostávajú v zariadení. Účet netre" w="fill" color="#161D1C" font="Helvetica Neue" bind={{ "fills/0/color": "1074826698:36" }}>Ukážkové údaje zostávajú v zariadení. Účet netreba.</Text>
        </Frame>
      </Frame>
    </Frame>
    <Frame name="Space / 28" w={1} h={28} />
    <Text name="Text / Jazyk" w="fill" color="#3F4947" size={13} font="Helvetica Neue" weight="medium" bind={{ "fills/0/color": "1074826698:37" }}>Jazyk</Text>
    <Frame name="Space / 10" w={1} h={10} />
    <Frame name="Layout / Podľa systému" flex="col" w="fill" bg="#FFFFFF" rounded={12} bind={{ "fills/0/color": "1074826698:40" }}>
      <Frame name="Jazyk / Podľa systému" flex="row" h={46} w="fill" items="center" py={0} px={16}>
        <Text name="Text / Podľa systému" grow={1} color="#161D1C" size={16} font="Helvetica Neue" bind={{ "fills/0/color": "1074826698:36" }}>Podľa systému</Text>
        <Frame name="Icon / check" w={20} h={20}>
          <Frame name="Icon / Frame" w={20} h={20}>
            <Vector name="path" w={20} h={20} stroke="#147D73" strokeWidth={1.4166666666666667} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
          </Frame>
        </Frame>
      </Frame>
      <Frame name="Rule / Divider" w="fill" h={0.6000000238418579} bg="#BEC9C6" bind={{ "fills/0/color": "1074826698:44" }} />
      <Frame name="Jazyk / Slovenčina" flex="row" h={46} w="fill" items="center" py={0} px={16}>
        <Text name="Text / Slovenčina" grow={1} color="#161D1C" size={16} font="Helvetica Neue" bind={{ "fills/0/color": "1074826698:36" }}>Slovenčina</Text>
        <Frame name="Jazyk / Frame" w={20} h={20} />
      </Frame>
      <Frame name="Rule / Divider" w="fill" h={0.6000000238418579} bg="#BEC9C6" bind={{ "fills/0/color": "1074826698:44" }} />
      <Frame name="Jazyk / English" flex="row" h={46} w="fill" items="center" py={0} px={16}>
        <Text name="Text / English" grow={1} color="#161D1C" size={16} font="Helvetica Neue" bind={{ "fills/0/color": "1074826698:36" }}>English</Text>
        <Frame name="Jazyk / Frame" w={20} h={20} />
      </Frame>
    </Frame>
    <Frame name="Space / 24" w={1} h={24} />
    <Text name="Text / Vzhľad" w="fill" color="#3F4947" size={13} font="Helvetica Neue" weight="medium" bind={{ "fills/0/color": "1074826698:37" }}>Vzhľad</Text>
    <Frame name="Space / 10" w={1} h={10} />
    <Frame name="Layout / Podľa systému" flex="col" w="fill" bg="#FFFFFF" rounded={12} bind={{ "fills/0/color": "1074826698:40" }}>
      <Frame name="Vzhľad / Podľa systému" flex="row" h={46} w="fill" items="center" py={0} px={16}>
        <Text name="Text / Podľa systému" grow={1} color="#161D1C" size={16} font="Helvetica Neue" bind={{ "fills/0/color": "1074826698:36" }}>Podľa systému</Text>
        <Frame name="Icon / check" w={20} h={20}>
          <Frame name="Icon / Frame" w={20} h={20}>
            <Vector name="path" w={20} h={20} stroke="#147D73" strokeWidth={1.4166666666666667} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
          </Frame>
        </Frame>
      </Frame>
      <Frame name="Rule / Divider" w="fill" h={0.6000000238418579} bg="#BEC9C6" bind={{ "fills/0/color": "1074826698:44" }} />
      <Frame name="Vzhľad / Svetlý" flex="row" h={46} w="fill" items="center" py={0} px={16}>
        <Text name="Text / Svetlý" grow={1} color="#161D1C" size={16} font="Helvetica Neue" bind={{ "fills/0/color": "1074826698:36" }}>Svetlý</Text>
        <Frame name="Vzhľad / Frame" w={20} h={20} />
      </Frame>
      <Frame name="Rule / Divider" w="fill" h={0.6000000238418579} bg="#BEC9C6" bind={{ "fills/0/color": "1074826698:44" }} />
      <Frame name="Vzhľad / Tmavý" flex="row" h={46} w="fill" items="center" py={0} px={16}>
        <Text name="Text / Tmavý" grow={1} color="#161D1C" size={16} font="Helvetica Neue" bind={{ "fills/0/color": "1074826698:36" }}>Tmavý</Text>
        <Frame name="Vzhľad / Frame" w={20} h={20} />
      </Frame>
    </Frame>
    <Frame name="Space / 24" w={1} h={24} />
    <Frame name="Layout / Pripojenie v deme" flex="col" w="fill" p={20} bg="#FFFFFF" stroke="#BEC9C6" strokeWidth={0.6} rounded={20} bind={{
      "fills/0/color": "1074826698:40",
      "strokes/0/color": "1074826698:44"
    }}>
      <Frame name="Layout / Pripojenie v deme" flex="row" w="fill" gap={12} items="center">
        <Frame name="Layout / Pripojenie v deme" flex="col" grow={1}>
          <Text name="Text / Pripojenie v deme" w="fill" color="#161D1C" size={16} font="Helvetica Neue" weight="medium" bind={{ "fills/0/color": "1074826698:36" }}>Pripojenie v deme</Text>
          <Frame name="Space / 6" w={1} h={6} />
          <Text name="Text / Vypni ho a vyskúšaj frontu odosielania bez siete" w="fill" color="#161D1C" size={12} font="Helvetica Neue" bind={{ "fills/0/color": "1074826698:36" }}>Vypni ho a vyskúšaj frontu odosielania bez siete.</Text>
        </Frame>
        <Frame name="Switch / Online" w={54} h={31} bg="#147D73" rounded={16} bind={{ "fills/0/color": "1074826698:31" }}>
          <Frame name="Switch / Frame" x={25} y={2} w={27} h={27} bg="#FFFFFF" rounded={14} />
        </Frame>
      </Frame>
    </Frame>
    <Frame name="Space / 24" w={1} h={24} />
    <Frame name="IOS / Button / Secondary / light" flex="row" h={52} w="fill" justify="center" items="center" bg="#DDE4E1" rounded={14} bind={{ "fills/0/color": "1074826698:38" }}>
      <Text name="Text / Obnoviť katalóg" color="#161D1C" size={17} font="Helvetica Neue" weight="medium" bind={{ "fills/0/color": "1074826698:36" }}>Obnoviť katalóg</Text>
    </Frame>
    <Frame name="Space / 12" w={1} h={12} />
    <Frame name="IOS / Button / Secondary / light" flex="row" h={52} w="fill" justify="center" items="center" bg="#DDE4E1" rounded={14} bind={{ "fills/0/color": "1074826698:38" }}>
      <Text name="Text / Opustiť demo" color="#161D1C" size={17} font="Helvetica Neue" weight="medium" bind={{ "fills/0/color": "1074826698:36" }}>Opustiť demo</Text>
    </Frame>
    <Frame name="Space / 24" w={1} h={24} />
    <Text name="Text / Flutter portfólio demo · v0.1.0" w="fill" color="#161D1C" size={12} font="Helvetica Neue" textAlign="center" bind={{ "fills/0/color": "1074826698:36" }}>Flutter portfólio demo · v0.1.0</Text>
  </Frame>
  <Frame name="12 · Nastavenia / Frame" y={878} w={420} h={34}>
    <Frame name="System / Home indicator" w={420} h={34}>
      <Frame name="Rule / Divider" x={143} y={20} w={134} h={5} bg="#161D1C" rounded={3} bind={{ "fills/0/color": "1074826698:36" }} />
    </Frame>
  </Frame>
</Frame>