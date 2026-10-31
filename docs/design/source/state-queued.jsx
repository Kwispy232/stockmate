<Frame name="10 · Kontrola inventúry" x={520} y={150} w={420} h={912} bg="#F4F6F3" overflow="hidden" bind={{ "fills/0/color": "1074826698:35" }}>
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
  <Frame name="Layout / Skontrolovať inventúru" y={59} w={420} h={44}>
    <Frame name="Navigation / Skontrolovať inventúru" w={420} h={44} bg="#F4F6F3" bind={{ "fills/0/color": "1074826698:35" }}>
      <Text name="Text / Skontrolovať inventúru" x={86} y={12} w={248} h={24} color="#161D1C" size={17} font="Helvetica Neue" weight="bold" textAlign="center" textAutoResize="none" bind={{ "fills/0/color": "1074826698:36" }}>Skontrolovať inventúru</Text>
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
    <Frame name="Inventory / Summary" flex="col" w="fill" p={20} bg="#FFFFFF" stroke="#BEC9C6" strokeWidth={0.6} rounded={20} bind={{
      "fills/0/color": "1074826698:40",
      "strokes/0/color": "1074826698:44"
    }}>
      <Frame name="Status / Čaká na odoslanie" flex="row" py={6} px={10} bg="#CDE5FF" rounded={20} bind={{ "fills/0/color": "1074826698:41" }}>
        <Text name="Text / Čaká na odoslanie" color="#2E4961" size={12} font="Helvetica Neue" weight="medium" bind={{ "fills/0/color": "1074826698:42" }}>Čaká na odoslanie</Text>
      </Frame>
      <Frame name="Space / 16" w={1} h={16} />
      <Text name="Text / Bratislava · Centrum" w="fill" color="#161D1C" size={16} font="Helvetica Neue" weight="medium" bind={{ "fills/0/color": "1074826698:36" }}>Bratislava · Centrum</Text>
      <Frame name="Space / 20" w={1} h={20} />
      <Text name="Text / 30 / 30" color="#161D1C" size={28} font="Helvetica Neue" weight="bold" bind={{ "fills/0/color": "1074826698:36" }}>30 / 30</Text>
      <Frame name="Space / 6" w={1} h={6} />
      <Text name="Text / Spočítané 30 z 30" color="#161D1C" font="Helvetica Neue" bind={{ "fills/0/color": "1074826698:36" }}>Spočítané 30 z 30</Text>
      <Frame name="Space / 16" w={1} h={16} />
      <Frame name="Progress" w="fill" h={6} bg="#DDE4E1" rounded={4} bind={{ "fills/0/color": "1074826698:38" }}>
        <Frame name="Rule / Divider" w={332} h={6} bg="#147D73" rounded={4} bind={{ "fills/0/color": "1074826698:31" }} />
      </Frame>
      <Frame name="Space / 16" w={1} h={16} />
      <Text name="Text / 2 rozdiely" color="#161D1C" font="Helvetica Neue" bind={{ "fills/0/color": "1074826698:36" }}>2 rozdiely</Text>
    </Frame>
    <Frame name="Space / 20" w={1} h={20} />
    <Frame name="Banner / Info" flex="row" w="fill" gap={10} p={16} bg="#9EF2E6" rounded={14} bind={{ "fills/0/color": "1074826698:33" }}>
      <Frame name="Icon / check" w={20} h={20}>
        <Frame name="Icon / Frame" w={20} h={20}>
          <Vector name="path" w={20} h={20} stroke="#005049" strokeWidth={1.4166666666666667} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
        </Frame>
      </Frame>
      <Text name="Text / Inventúra je uložená a uzamknutá. Odoslanie môže" grow={1} color="#005049" font="Helvetica Neue" bind={{ "fills/0/color": "1074826698:34" }}>Inventúra je uložená a uzamknutá. Odoslanie môžeš zopakovať teraz alebo neskôr.</Text>
    </Frame>
    <Frame name="Space / 24" w={1} h={24} />
    <Frame name="iOS / Button / Primary" flex="row" h={52} w="fill" justify="center" items="center" bg="#147D73" rounded={14} bind={{ "fills/0/color": "1074826698:31" }}>
      <Text name="Text / Skúsiť znova" color="#FFFFFF" size={17} font="Helvetica Neue" weight="medium">Skúsiť znova</Text>
    </Frame>
    <Frame name="Space / 24" w={1} h={24} />
    <Text name="Text / Rozdiel" w="fill" color="#161D1C" size={22} font="Helvetica Neue" weight="medium" bind={{ "fills/0/color": "1074826698:36" }}>Rozdiel</Text>
    <Frame name="Space / 12" w={1} h={12} />
    <Frame name="Variance / Coffee beans 250 g" flex="col" w="fill" p={20} bg="#FFFFFF" stroke="#BEC9C6" strokeWidth={0.6} rounded={20} bind={{
      "fills/0/color": "1074826698:40",
      "strokes/0/color": "1074826698:44"
    }}>
      <Text name="Text / Coffee beans 250 g" w="fill" color="#161D1C" size={16} font="Helvetica Neue" weight="medium" bind={{ "fills/0/color": "1074826698:36" }}>Coffee beans 250 g</Text>
      <Frame name="Space / 12" w={1} h={12} />
      <Text name="Text / Evidované: 12     Spočítané: 8" w="fill" color="#161D1C" font="Helvetica Neue" bind={{ "fills/0/color": "1074826698:36" }}>Evidované: 12     Spočítané: 8</Text>
      <Frame name="Space / 8" w={1} h={8} />
      <Text name="Text / Rozdiel: -4" color="#BA1A1A" font="Helvetica Neue" weight="bold" bind={{ "fills/0/color": "1074826698:45" }}>Rozdiel: -4</Text>
    </Frame>
    <Frame name="Space / 10" w={1} h={10} />
    <Frame name="Variance / Sparkling water 1.5 l" flex="col" w="fill" p={20} bg="#FFFFFF" stroke="#BEC9C6" strokeWidth={0.6} rounded={20} bind={{
      "fills/0/color": "1074826698:40",
      "strokes/0/color": "1074826698:44"
    }}>
      <Text name="Text / Sparkling water 1.5 l" w="fill" color="#161D1C" size={16} font="Helvetica Neue" weight="medium" bind={{ "fills/0/color": "1074826698:36" }}>Sparkling water 1.5 l</Text>
      <Frame name="Space / 12" w={1} h={12} />
      <Text name="Text / Evidované: 24     Spočítané: 22" w="fill" color="#161D1C" font="Helvetica Neue" bind={{ "fills/0/color": "1074826698:36" }}>Evidované: 24     Spočítané: 22</Text>
      <Frame name="Space / 8" w={1} h={8} />
      <Text name="Text / Rozdiel: -2" color="#BA1A1A" font="Helvetica Neue" weight="bold" bind={{ "fills/0/color": "1074826698:45" }}>Rozdiel: -2</Text>
    </Frame>
    <Frame name="Space / 10" w={1} h={10} />
  </Frame>
  <Frame name="10 · Kontrola inventúry / Frame" y={878} w={420} h={34}>
    <Frame name="System / Home indicator" w={420} h={34}>
      <Frame name="Rule / Divider" x={143} y={20} w={134} h={5} bg="#161D1C" rounded={3} bind={{ "fills/0/color": "1074826698:36" }} />
    </Frame>
  </Frame>
</Frame>