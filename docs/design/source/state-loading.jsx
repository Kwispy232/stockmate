<Frame name="Načítavanie" x={1560} y={1250} w={420} h={912} bg="#F4F6F3" overflow="hidden" bind={{ "fills/0/color": "1074826698:35" }}>
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
      <Frame name="Rule / Divider" y={43} w={420} h={1} bg="#BEC9C6" bind={{ "fills/0/color": "1074826698:44" }} />
    </Frame>
  </Frame>
  <Frame name="Content / scroll" x={24} y={127} flex="col" w={372} />
  <Frame name="Načítavanie / Frame" y={878} w={420} h={34}>
    <Frame name="System / Home indicator" w={420} h={34}>
      <Frame name="Rule / Divider" x={143} y={20} w={134} h={5} bg="#161D1C" rounded={3} bind={{ "fills/0/color": "1074826698:36" }} />
    </Frame>
  </Frame>
  <Frame name="System / Activity indicator" x={190} y={430} w={40} h={40}>
    <Frame name="System / Frame" x={28} y={16} w={3} h={7} bg="#6F7977" rounded={2} opacity={0.08} />
    <Frame name="System / Frame" x={26.392304845413264} y={22} w={3} h={7} bg="#6F7977" rounded={2} opacity={0.17} rotate={30} />
    <Frame name="System / Frame" x={22} y={26.392304845413264} w={3} h={7} bg="#6F7977" rounded={2} opacity={0.25} rotate={60} />
    <Frame name="System / Frame" x={16} y={28} w={3} h={7} bg="#6F7977" rounded={2} opacity={0.33} rotate={90} />
    <Frame name="System / Frame" x={10.000000000000002} y={26.392304845413264} w={3} h={7} bg="#6F7977" rounded={2} opacity={0.42} rotate={120} />
    <Frame name="System / Frame" x={5.607695154586736} y={22} w={3} h={7} bg="#6F7977" rounded={2} opacity={0.5} rotate={150} />
    <Frame name="System / Frame" x={4} y={16} w={3} h={7} bg="#6F7977" rounded={2} opacity={0.58} rotate={180} />
    <Frame name="System / Frame" x={5.607695154586734} y={10.000000000000004} w={3} h={7} bg="#6F7977" rounded={2} opacity={0.67} rotate={210} />
    <Frame name="System / Frame" x={9.999999999999995} y={5.6076951545867395} w={3} h={7} bg="#6F7977" rounded={2} opacity={0.75} rotate={240} />
    <Frame name="System / Frame" x={15.999999999999998} y={4} w={3} h={7} bg="#6F7977" rounded={2} opacity={0.83} rotate={270} />
    <Frame name="System / Frame" x={22} y={5.607695154586736} w={3} h={7} bg="#6F7977" rounded={2} opacity={0.92} rotate={300} />
    <Frame name="System / Frame" x={26.39230484541326} y={9.999999999999995} w={3} h={7} bg="#6F7977" rounded={2} rotate={330} />
  </Frame>
</Frame>