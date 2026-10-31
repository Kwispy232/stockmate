<Frame name="08 · Úprava počtu" x={520} y={1240} w={420} h={912} bg="#F4F6F3" overflow="hidden" bind={{ "fills/0/color": "1074826698:35" }}>
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
  <Frame name="Layout / Ranná inventúra" y={59} w={420} h={44}>
    <Frame name="Navigation / Ranná inventúra" w={420} h={44} bg="#F4F6F3" bind={{ "fills/0/color": "1074826698:35" }}>
      <Text name="Text / Ranná inventúra" x={86} y={12} w={248} h={24} color="#161D1C" size={17} font="Helvetica Neue" weight="bold" textAlign="center" textAutoResize="none" bind={{ "fills/0/color": "1074826698:36" }}>Ranná inventúra</Text>
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
      <Frame name="Status / Rozpracovaná" flex="row" py={6} px={10} bg="#9EF2E6" rounded={20} bind={{ "fills/0/color": "1074826698:33" }}>
        <Text name="Text / Rozpracovaná" color="#005049" size={12} font="Helvetica Neue" weight="medium" bind={{ "fills/0/color": "1074826698:34" }}>Rozpracovaná</Text>
      </Frame>
      <Frame name="Space / 16" w={1} h={16} />
      <Text name="Text / Bratislava · Centrum" w="fill" color="#161D1C" size={16} font="Helvetica Neue" weight="medium" bind={{ "fills/0/color": "1074826698:36" }}>Bratislava · Centrum</Text>
      <Frame name="Space / 20" w={1} h={20} />
      <Text name="Text / 12 / 30" color="#161D1C" size={28} font="Helvetica Neue" weight="bold" bind={{ "fills/0/color": "1074826698:36" }}>12 / 30</Text>
      <Frame name="Space / 6" w={1} h={6} />
      <Text name="Text / Spočítané 12 z 30" color="#161D1C" font="Helvetica Neue" bind={{ "fills/0/color": "1074826698:36" }}>Spočítané 12 z 30</Text>
      <Frame name="Space / 16" w={1} h={16} />
      <Frame name="Progress" w="fill" h={6} bg="#DDE4E1" rounded={4} bind={{ "fills/0/color": "1074826698:38" }}>
        <Frame name="Rule / Divider" w={132} h={6} bg="#147D73" rounded={4} bind={{ "fills/0/color": "1074826698:31" }} />
      </Frame>
      <Frame name="Space / 16" w={1} h={16} />
      <Text name="Text / 2 rozdiely" color="#161D1C" font="Helvetica Neue" bind={{ "fills/0/color": "1074826698:36" }}>2 rozdiely</Text>
    </Frame>
    <Frame name="Space / 16" w={1} h={16} />
    <Frame name="iOS / Button / Primary" flex="row" h={52} w="fill" justify="center" items="center" bg="#147D73" rounded={14} bind={{ "fills/0/color": "1074826698:31" }}>
      <Text name="Text / Skenovať kód" color="#FFFFFF" size={17} font="Helvetica Neue" weight="medium">Skenovať kód</Text>
    </Frame>
  </Frame>
  <Frame name="08 · Úprava počtu / Frame" y={878} w={420} h={34}>
    <Frame name="System / Home indicator" w={420} h={34}>
      <Frame name="Rule / Divider" x={143} y={20} w={134} h={5} bg="#161D1C" rounded={3} bind={{ "fills/0/color": "1074826698:36" }} />
    </Frame>
  </Frame>
  <Frame name="Modal / Scrim" w={420} h={912} bg="#000000" opacity={0.35} />
  <Frame name="Count editor / Bottom sheet" y={431} flex="col" w={420} p={24} bg="#F4F6F3" roundedTL={24} roundedTR={24} bind={{ "fills/0/color": "1074826698:35" }}>
    <Frame name="Layout / Coffee beans 250 g" flex="row" w="fill" gap={10} items="center">
      <Text name="Text / Coffee beans 250 g" grow={1} color="#161D1C" size={22} font="Helvetica Neue" weight="medium" bind={{ "fills/0/color": "1074826698:36" }}>Coffee beans 250 g</Text>
      <Frame name="Icon / close" w={24} h={24}>
        <Frame name="Icon / Frame" w={24} h={24}>
          <Vector name="path" w={24} h={24} stroke="#147D73" strokeWidth={1.7} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
        </Frame>
      </Frame>
    </Frame>
    <Frame name="Space / 6" w={1} h={6} />
    <Text name="Text / Evidované: 12 · SM-001" color="#161D1C" font="Helvetica Neue" bind={{ "fills/0/color": "1074826698:36" }}>Evidované: 12 · SM-001</Text>
    <Frame name="Space / 24" w={1} h={24} />
    <Frame name="Layout / Počet kusov" flex="col" w="fill">
      <Text name="Text / Počet kusov" w="fill" color="#161D1C" font="Helvetica Neue" weight="medium" bind={{ "fills/0/color": "1074826698:36" }}>Počet kusov</Text>
      <Frame name="Space / 8" w={1} h={8} />
      <Frame name="Field / Počet kusov" flex="row" h={54} w="fill" items="center" p={15} bg="#FFFFFF" stroke="#BEC9C6" rounded={12} bind={{
        "fills/0/color": "1074826698:40",
        "strokes/0/color": "1074826698:44"
      }}>
        <Text name="Text / 8" grow={1} color="#161D1C" size={16} font="Helvetica Neue" bind={{ "fills/0/color": "1074826698:36" }}>8</Text>
      </Frame>
    </Frame>
    <Frame name="Space / 24" w={1} h={24} />
    <Frame name="iOS / Button / Primary" flex="row" h={52} w="fill" justify="center" items="center" bg="#147D73" rounded={14} bind={{ "fills/0/color": "1074826698:31" }}>
      <Text name="Text / Uložiť počet" color="#FFFFFF" size={17} font="Helvetica Neue" weight="medium">Uložiť počet</Text>
    </Frame>
  </Frame>
  <Frame name="System / Numeric keyboard" y={708} w={420} h={204} bg="#D2D5D9">
    <Frame name="Key / 1" x={8} y={8} flex="row" w={124} h={39} justify="center" items="center" bg="#FFFFFF" rounded={6}>
      <Text name="Text / 1" grow={1} color="#161D1C" size={24} font="Helvetica Neue" weight="medium" textAlign="center" bind={{ "fills/0/color": "1074826698:36" }}>1</Text>
    </Frame>
    <Frame name="Key / 2" x={148} y={8} flex="row" w={124} h={39} justify="center" items="center" bg="#FFFFFF" rounded={6}>
      <Text name="Text / 2" grow={1} color="#161D1C" size={24} font="Helvetica Neue" weight="medium" textAlign="center" bind={{ "fills/0/color": "1074826698:36" }}>2</Text>
    </Frame>
    <Frame name="Key / 3" x={288} y={8} flex="row" w={124} h={39} justify="center" items="center" bg="#FFFFFF" rounded={6}>
      <Text name="Text / 3" grow={1} color="#161D1C" size={24} font="Helvetica Neue" weight="medium" textAlign="center" bind={{ "fills/0/color": "1074826698:36" }}>3</Text>
    </Frame>
    <Frame name="Key / 4" x={8} y={53} flex="row" w={124} h={39} justify="center" items="center" bg="#FFFFFF" rounded={6}>
      <Text name="Text / 4" grow={1} color="#161D1C" size={24} font="Helvetica Neue" weight="medium" textAlign="center" bind={{ "fills/0/color": "1074826698:36" }}>4</Text>
    </Frame>
    <Frame name="Key / 5" x={148} y={53} flex="row" w={124} h={39} justify="center" items="center" bg="#FFFFFF" rounded={6}>
      <Text name="Text / 5" grow={1} color="#161D1C" size={24} font="Helvetica Neue" weight="medium" textAlign="center" bind={{ "fills/0/color": "1074826698:36" }}>5</Text>
    </Frame>
    <Frame name="Key / 6" x={288} y={53} flex="row" w={124} h={39} justify="center" items="center" bg="#FFFFFF" rounded={6}>
      <Text name="Text / 6" grow={1} color="#161D1C" size={24} font="Helvetica Neue" weight="medium" textAlign="center" bind={{ "fills/0/color": "1074826698:36" }}>6</Text>
    </Frame>
    <Frame name="Key / 7" x={8} y={98} flex="row" w={124} h={39} justify="center" items="center" bg="#FFFFFF" rounded={6}>
      <Text name="Text / 7" grow={1} color="#161D1C" size={24} font="Helvetica Neue" weight="medium" textAlign="center" bind={{ "fills/0/color": "1074826698:36" }}>7</Text>
    </Frame>
    <Frame name="Key / 8" x={148} y={98} flex="row" w={124} h={39} justify="center" items="center" bg="#FFFFFF" rounded={6}>
      <Text name="Text / 8" grow={1} color="#161D1C" size={24} font="Helvetica Neue" weight="medium" textAlign="center" bind={{ "fills/0/color": "1074826698:36" }}>8</Text>
    </Frame>
    <Frame name="Key / 9" x={288} y={98} flex="row" w={124} h={39} justify="center" items="center" bg="#FFFFFF" rounded={6}>
      <Text name="Text / 9" grow={1} color="#161D1C" size={24} font="Helvetica Neue" weight="medium" textAlign="center" bind={{ "fills/0/color": "1074826698:36" }}>9</Text>
    </Frame>
    <Frame name="Key / " x={8} y={143} flex="row" w={124} h={39} justify="center" items="center" bg="#FFFFFF" rounded={6}>
      <Text name="Text / Empty field value" grow={1} color="#161D1C" size={24} font="Helvetica Neue" weight="medium" textAlign="center" bind={{ "fills/0/color": "1074826698:36" }} />
    </Frame>
    <Frame name="Key / 0" x={148} y={143} flex="row" w={124} h={39} justify="center" items="center" bg="#FFFFFF" rounded={6}>
      <Text name="Text / 0" grow={1} color="#161D1C" size={24} font="Helvetica Neue" weight="medium" textAlign="center" bind={{ "fills/0/color": "1074826698:36" }}>0</Text>
    </Frame>
    <Frame name="Key / ⌫" x={288} y={143} flex="row" w={124} h={39} justify="center" items="center" bg="#FFFFFF" rounded={6}>
      <Text name="Text / ⌫" grow={1} color="#161D1C" size={24} font="Helvetica Neue" weight="medium" textAlign="center" bind={{ "fills/0/color": "1074826698:36" }}>⌫</Text>
    </Frame>
    <Frame name="System / Home indicator" x={143} y={193} w={134} h={5} bg="#161D1C" rounded={3} bind={{ "fills/0/color": "1074826698:36" }} />
  </Frame>
</Frame>