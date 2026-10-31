<Frame name="05 · Nová inventúra / new" x={2080} y={140} w={420} h={912} bg="#F4F6F3" overflow="hidden" bind={{ "fills/0/color": "1074826698:35" }}>
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
  <Frame name="Layout / Nová inventúra" y={59} w={420} h={44}>
    <Frame name="Navigation / Nová inventúra" w={420} h={44} bg="#F4F6F3" bind={{ "fills/0/color": "1074826698:35" }}>
      <Text name="Text / Nová inventúra" x={86} y={12} w={248} h={24} color="#161D1C" size={17} font="Helvetica Neue" weight="bold" textAlign="center" textAutoResize="none" bind={{ "fills/0/color": "1074826698:36" }}>Nová inventúra</Text>
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
    <Frame name="Layout / Názov inventúry" flex="col" w="fill">
      <Text name="Text / Názov inventúry" w="fill" color="#161D1C" font="Helvetica Neue" weight="medium" bind={{ "fills/0/color": "1074826698:36" }}>Názov inventúry</Text>
      <Frame name="Space / 8" w={1} h={8} />
      <Frame name="Field / Názov inventúry" flex="row" h={54} w="fill" items="center" p={15} bg="#FFFFFF" stroke="#BEC9C6" rounded={12} bind={{
        "fills/0/color": "1074826698:40",
        "strokes/0/color": "1074826698:44"
      }}>
        <Text name="Text / Inventúra · 31. okt" grow={1} color="#161D1C" size={16} font="Helvetica Neue" bind={{ "fills/0/color": "1074826698:36" }}>Inventúra · 31. okt</Text>
      </Frame>
    </Frame>
    <Frame name="Space / 28" w={1} h={28} />
    <Text name="Text / Predajňa" w="fill" color="#161D1C" size={16} font="Helvetica Neue" weight="medium" bind={{ "fills/0/color": "1074826698:36" }}>Predajňa</Text>
    <Frame name="Space / 12" w={1} h={12} />
    <Frame name="Branch / Bratislava · Centrum" flex="col" w="fill" p={20} bg="#FFFFFF" stroke="#BEC9C6" strokeWidth={0.6} rounded={20} bind={{
      "fills/0/color": "1074826698:40",
      "strokes/0/color": "1074826698:44"
    }}>
      <Frame name="Layout / Bratislava · Centrum" flex="row" h={32} w="fill" gap={16} items="center">
        <Frame name="Icon / store" w={24} h={24}>
          <Frame name="Icon / Frame" w={24} h={24}>
            <Vector name="path" w={24} h={24} stroke="#147D73" strokeWidth={1.7} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
          </Frame>
        </Frame>
        <Text name="Text / Bratislava · Centrum" grow={1} color="#161D1C" size={16} font="Helvetica Neue" weight="medium" bind={{ "fills/0/color": "1074826698:36" }}>Bratislava · Centrum</Text>
        <Frame name="Icon / check" w={22} h={22}>
          <Frame name="Icon / Frame" w={22} h={22}>
            <Vector name="path" w={22} h={22} stroke="#147D73" strokeWidth={1.5583333333333331} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
          </Frame>
        </Frame>
      </Frame>
    </Frame>
    <Frame name="Space / 12" w={1} h={12} />
    <Frame name="Branch / Bratislava · Nivy" flex="col" w="fill" p={20} bg="#FFFFFF" stroke="#BEC9C6" strokeWidth={0.6} rounded={20} bind={{
      "fills/0/color": "1074826698:40",
      "strokes/0/color": "1074826698:44"
    }}>
      <Frame name="Layout / Bratislava · Nivy" flex="row" h={32} w="fill" gap={16} items="center">
        <Frame name="Icon / store" w={24} h={24}>
          <Frame name="Icon / Frame" w={24} h={24}>
            <Vector name="path" w={24} h={24} stroke="#147D73" strokeWidth={1.7} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
          </Frame>
        </Frame>
        <Text name="Text / Bratislava · Nivy" grow={1} color="#161D1C" size={16} font="Helvetica Neue" weight="medium" bind={{ "fills/0/color": "1074826698:36" }}>Bratislava · Nivy</Text>
        <Frame name="Icon / box" w={22} h={22}>
          <Frame name="Icon / Frame" w={22} h={22}>
            <Vector name="path" w={22} h={22} stroke="#147D73" strokeWidth={1.5583333333333331} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
          </Frame>
        </Frame>
      </Frame>
    </Frame>
    <Frame name="Space / 12" w={1} h={12} />
    <Frame name="Space / 20" w={1} h={20} />
    <Frame name="iOS / Button / Primary" flex="row" h={52} w="fill" justify="center" items="center" bg="#147D73" rounded={14} bind={{ "fills/0/color": "1074826698:31" }}>
      <Text name="Text / Začať počítať" color="#FFFFFF" size={17} font="Helvetica Neue" weight="medium">Začať počítať</Text>
    </Frame>
  </Frame>
  <Frame name="05 · Nová inventúra / Frame" y={878} w={420} h={34}>
    <Frame name="System / Home indicator" w={420} h={34}>
      <Frame name="Rule / Divider" x={143} y={20} w={134} h={5} bg="#161D1C" rounded={3} bind={{ "fills/0/color": "1074826698:36" }} />
    </Frame>
  </Frame>
</Frame>