<Frame name="12 · Nastavenia" x={1560} y={590} w={412} h={924} bg="#111B18" overflow="hidden" bind={{ "fills/0/color": "1074826698:16" }}>
  <Frame name="System / Status bar" w={412} h={24} bg="#111B18" bind={{ "fills/0/color": "1074826698:16" }}>
    <Text name="Text / 9:41" x={18} y={4} color="#DDE4E1" size={12} font="Roboto" weight={600} bind={{ "fills/0/color": "1074826698:17" }}>9:41</Text>
    <Frame name="System / Frame" x={320} y={7} flex="row" w={72} h={14} gap={6} items="center">
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
  <Frame name="Layout / Nastavenia" y={24} w={412} h={56}>
    <Frame name="Navigation / Nastavenia" w={412} h={56} bg="#111B18" bind={{ "fills/0/color": "1074826698:16" }}>
      <Text name="Text / Nastavenia" x={56} y={15} w={304} h={28} color="#DDE4E1" size={20} font="Roboto" weight={600} textAutoResize="none" bind={{ "fills/0/color": "1074826698:17" }}>Nastavenia</Text>
      <Frame name="Icon / back" x={16} y={16} w={24} h={24}>
        <Frame name="Icon / Frame" w={24} h={24}>
          <Vector name="path" w={24} h={24} stroke="#DDE4E1" strokeWidth={1.7} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
        </Frame>
      </Frame>
    </Frame>
  </Frame>
  <Frame name="Content / scroll" x={24} y={104} flex="col" w={364}>
    <Frame name="Layout / Lokálne demo" flex="col" w="fill" p={20} bg="#090F0E" stroke="#3F4947" strokeWidth={0.6} rounded={20} bind={{
      "fills/0/color": "1074826698:21",
      "strokes/0/color": "1074826698:25"
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
          <Text name="Text / Lokálne demo" w="fill" color="#DDE4E1" size={16} font="Roboto" weight="medium" bind={{ "fills/0/color": "1074826698:17" }}>Lokálne demo</Text>
          <Frame name="Space / 6" w={1} h={6} />
          <Text name="Text / Ukážkové údaje zostávajú v zariadení. Účet netre" w="fill" color="#DDE4E1" font="Roboto" bind={{ "fills/0/color": "1074826698:17" }}>Ukážkové údaje zostávajú v zariadení. Účet netreba.</Text>
        </Frame>
      </Frame>
    </Frame>
    <Frame name="Space / 28" w={1} h={28} />
    <Text name="Text / Jazyk" w="fill" color="#BEC9C6" size={16} font="Roboto" weight="medium" bind={{ "fills/0/color": "1074826698:18" }}>Jazyk</Text>
    <Frame name="Space / 10" w={1} h={10} />
    <Frame name="Layout / Podľa systému" flex="col" w="fill" bg="#090F0E" rounded={20} bind={{ "fills/0/color": "1074826698:21" }}>
      <Frame name="Jazyk / Podľa systému" flex="row" h={46} w="fill" items="center" py={0} px={16}>
        <Text name="Text / Podľa systému" grow={1} color="#DDE4E1" size={16} font="Roboto" bind={{ "fills/0/color": "1074826698:17" }}>Podľa systému</Text>
        <Frame name="Icon / check" w={20} h={20}>
          <Frame name="Icon / Frame" w={20} h={20}>
            <Vector name="path" w={20} h={20} stroke="#8DD8C5" strokeWidth={1.4166666666666667} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
          </Frame>
        </Frame>
      </Frame>
      <Frame name="Rule / Divider" w="fill" h={0.6000000238418579} bg="#3F4947" bind={{ "fills/0/color": "1074826698:25" }} />
      <Frame name="Jazyk / Slovenčina" flex="row" h={46} w="fill" items="center" py={0} px={16}>
        <Text name="Text / Slovenčina" grow={1} color="#DDE4E1" size={16} font="Roboto" bind={{ "fills/0/color": "1074826698:17" }}>Slovenčina</Text>
        <Frame name="Jazyk / Frame" w={20} h={20} />
      </Frame>
      <Frame name="Rule / Divider" w="fill" h={0.6000000238418579} bg="#3F4947" bind={{ "fills/0/color": "1074826698:25" }} />
      <Frame name="Jazyk / English" flex="row" h={46} w="fill" items="center" py={0} px={16}>
        <Text name="Text / English" grow={1} color="#DDE4E1" size={16} font="Roboto" bind={{ "fills/0/color": "1074826698:17" }}>English</Text>
        <Frame name="Jazyk / Frame" w={20} h={20} />
      </Frame>
    </Frame>
    <Frame name="Space / 24" w={1} h={24} />
    <Text name="Text / Vzhľad" w="fill" color="#BEC9C6" size={16} font="Roboto" weight="medium" bind={{ "fills/0/color": "1074826698:18" }}>Vzhľad</Text>
    <Frame name="Space / 10" w={1} h={10} />
    <Frame name="Layout / Podľa systému" flex="col" w="fill" bg="#090F0E" rounded={20} bind={{ "fills/0/color": "1074826698:21" }}>
      <Frame name="Vzhľad / Podľa systému" flex="row" h={46} w="fill" items="center" py={0} px={16}>
        <Text name="Text / Podľa systému" grow={1} color="#DDE4E1" size={16} font="Roboto" bind={{ "fills/0/color": "1074826698:17" }}>Podľa systému</Text>
        <Frame name="Icon / check" w={20} h={20}>
          <Frame name="Icon / Frame" w={20} h={20}>
            <Vector name="path" w={20} h={20} stroke="#8DD8C5" strokeWidth={1.4166666666666667} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
          </Frame>
        </Frame>
      </Frame>
      <Frame name="Rule / Divider" w="fill" h={0.6000000238418579} bg="#3F4947" bind={{ "fills/0/color": "1074826698:25" }} />
      <Frame name="Vzhľad / Svetlý" flex="row" h={46} w="fill" items="center" py={0} px={16}>
        <Text name="Text / Svetlý" grow={1} color="#DDE4E1" size={16} font="Roboto" bind={{ "fills/0/color": "1074826698:17" }}>Svetlý</Text>
        <Frame name="Vzhľad / Frame" w={20} h={20} />
      </Frame>
      <Frame name="Rule / Divider" w="fill" h={0.6000000238418579} bg="#3F4947" bind={{ "fills/0/color": "1074826698:25" }} />
      <Frame name="Vzhľad / Tmavý" flex="row" h={46} w="fill" items="center" py={0} px={16}>
        <Text name="Text / Tmavý" grow={1} color="#DDE4E1" size={16} font="Roboto" bind={{ "fills/0/color": "1074826698:17" }}>Tmavý</Text>
        <Frame name="Vzhľad / Frame" w={20} h={20} />
      </Frame>
    </Frame>
    <Frame name="Space / 24" w={1} h={24} />
    <Frame name="Layout / Pripojenie v deme" flex="col" w="fill" p={20} bg="#090F0E" stroke="#3F4947" strokeWidth={0.6} rounded={20} bind={{
      "fills/0/color": "1074826698:21",
      "strokes/0/color": "1074826698:25"
    }}>
      <Frame name="Layout / Pripojenie v deme" flex="row" w="fill" gap={12} items="center">
        <Frame name="Layout / Pripojenie v deme" flex="col" grow={1}>
          <Text name="Text / Pripojenie v deme" w="fill" color="#DDE4E1" size={16} font="Roboto" weight="medium" bind={{ "fills/0/color": "1074826698:17" }}>Pripojenie v deme</Text>
          <Frame name="Space / 6" w={1} h={6} />
          <Text name="Text / Vypni ho a vyskúšaj frontu odosielania bez siete" w="fill" color="#DDE4E1" size={12} font="Roboto" bind={{ "fills/0/color": "1074826698:17" }}>Vypni ho a vyskúšaj frontu odosielania bez siete.</Text>
        </Frame>
        <Frame name="Switch / Online" w={54} h={31} bg="#8DD8C5" rounded={16} bind={{ "fills/0/color": "1074826698:12" }}>
          <Frame name="Switch / Frame" x={25} y={2} w={27} h={27} bg="#FFFFFF" rounded={14} />
        </Frame>
      </Frame>
    </Frame>
    <Frame name="Space / 24" w={1} h={24} />
    <Frame name="ANDROID / Button / Secondary / dark" flex="row" h={52} w="fill" justify="center" items="center" bg="#303635" rounded={14} bind={{ "fills/0/color": "1074826698:19" }}>
      <Text name="Text / Obnoviť katalóg" color="#DDE4E1" font="Roboto" weight="medium" bind={{ "fills/0/color": "1074826698:17" }}>Obnoviť katalóg</Text>
    </Frame>
    <Frame name="Space / 12" w={1} h={12} />
    <Frame name="ANDROID / Button / Secondary / dark" flex="row" h={52} w="fill" justify="center" items="center" bg="#303635" rounded={14} bind={{ "fills/0/color": "1074826698:19" }}>
      <Text name="Text / Opustiť demo" color="#DDE4E1" font="Roboto" weight="medium" bind={{ "fills/0/color": "1074826698:17" }}>Opustiť demo</Text>
    </Frame>
    <Frame name="Space / 24" w={1} h={24} />
    <Text name="Text / Flutter portfólio demo · v0.1.0" w="fill" color="#DDE4E1" size={12} font="Roboto" textAlign="center" bind={{ "fills/0/color": "1074826698:17" }}>Flutter portfólio demo · v0.1.0</Text>
  </Frame>
  <Frame name="12 · Nastavenia / Frame" y={896} w={412} h={28}>
    <Frame name="System / Gesture navigation" w={412} h={28}>
      <Frame name="Rule / Divider" x={156} y={13} w={100} h={4} bg="#BEC9C6" rounded={3} bind={{ "fills/0/color": "1074826698:18" }} />
    </Frame>
  </Frame>
</Frame>