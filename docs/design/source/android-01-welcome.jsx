<Frame name="01 · Úvod / welcome" y={140} w={412} h={924} bg="#F4F6F3" overflow="hidden" bind={{ "fills/0/color": "1074826698:35" }}>
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
  <Frame name="Layout / StockMate" y={24} w={412} h={56}>
    <Frame name="Navigation / StockMate" w={412} h={56} bg="#F4F6F3" bind={{ "fills/0/color": "1074826698:35" }}>
      <Text name="Text / StockMate" x={16} y={15} w={340} h={28} color="#161D1C" size={20} font="Roboto" weight={600} textAutoResize="none" bind={{ "fills/0/color": "1074826698:36" }}>StockMate</Text>
    </Frame>
  </Frame>
  <Frame name="Content / scroll" x={24} y={104} flex="col" w={364}>
    <Frame name="Space / 24" w={1} h={24} />
    <Frame name="StockMate / Original SVG" w={80} h={80}>
      <Frame name="StockMate / Frame" w={80} h={80}>
        <Vector name="path" w={80} h={80} bg="#147D73" constraints={{ horizontal: "scale", vertical: "scale" }} />
        <Vector name="path" w={80} h={80} stroke="#FFFFFF" strokeWidth={3.3333333333333335} strokeAlign="center" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
        <Vector name="path" w={80} h={80} stroke="#FFFFFF" strokeWidth={3.3333333333333335} strokeAlign="center" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
        <Vector name="path" w={80} h={80} bg="#DFFFAB" constraints={{ horizontal: "scale", vertical: "scale" }} />
        <Vector name="path" w={80} h={80} stroke="#11564F" strokeWidth={3.3333333333333335} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
      </Frame>
    </Frame>
    <Frame name="Space / 32" w={1} h={32} />
    <Text name="Text / Každý kus. Pod kontrolou." w="fill" color="#161D1C" size={36} font="Roboto" weight={800} lineHeight={44} letterSpacing={-1.8} bind={{ "fills/0/color": "1074826698:36" }}>{"Každý kus.\nPod kontrolou."}</Text>
    <Frame name="Space / 18" w={1} h={18} />
    <Text name="Text / Naskenuj, spočítaj a pokračuj. Inventúra zostane" w="fill" color="#3F4947" size={16} font="Roboto" weight="medium" lineHeight={24} bind={{ "fills/0/color": "1074826698:37" }}>Naskenuj, spočítaj a pokračuj. Inventúra zostane v bezpečí aj bez pripojenia.</Text>
    <Frame name="Space / 30" w={1} h={30} />
    <Frame name="Welcome / Feature panel" flex="col" w="fill" p={24} bg="#123E38" rounded={24}>
      <Frame name="Icon / scan" w={36} h={36}>
        <Frame name="Icon / Frame" w={36} h={36}>
          <Vector name="path" w={36} h={36} stroke="#DFFFAB" strokeWidth={2.55} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
        </Frame>
      </Frame>
      <Frame name="Space / 28" w={1} h={28} />
      <Text name="Text / Trochu poriadku. Veľa prehľadu." w="fill" color="#FFFFFF" size={24} font="Roboto" weight={600}>Trochu poriadku. Veľa prehľadu.</Text>
      <Frame name="Space / 12" w={1} h={12} />
      <Text name="Text / Ukážkové údaje zostávajú v zariadení. Účet netre" w="fill" color="#B8CCCA" font="Roboto" lineHeight={20}>Ukážkové údaje zostávajú v zariadení. Účet netreba.</Text>
    </Frame>
    <Frame name="Space / 30" w={1} h={30} />
    <Frame name="ANDROID / Button / Primary / light" flex="row" h={52} w="fill" justify="center" items="center" bg="#147D73" rounded={14} bind={{ "fills/0/color": "1074826698:31" }}>
      <Text name="Text / Vyskúšať demo" color="#FFFFFF" font="Roboto" weight="medium" bind={{ "fills/0/color": "1074826698:32" }}>Vyskúšať demo</Text>
    </Frame>
    <Frame name="Space / 12" w={1} h={12} />
    <Frame name="ANDROID / Button / Secondary / light" flex="row" h={52} w="fill" justify="center" items="center" bg="#DDE4E1" rounded={14} bind={{ "fills/0/color": "1074826698:38" }}>
      <Text name="Text / Prihlásiť sa" color="#161D1C" font="Roboto" weight="medium" bind={{ "fills/0/color": "1074826698:36" }}>Prihlásiť sa</Text>
    </Frame>
  </Frame>
  <Frame name="01 · Úvod / Frame" y={896} w={412} h={28}>
    <Frame name="System / Gesture navigation" w={412} h={28}>
      <Frame name="Rule / Divider" x={156} y={13} w={100} h={4} bg="#3F4947" rounded={3} bind={{ "fills/0/color": "1074826698:37" }} />
    </Frame>
  </Frame>
</Frame>