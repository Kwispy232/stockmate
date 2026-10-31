<Frame name="09 · Skener — zamietnutá kamera" y={1250} w={420} h={912} bg="#F4F6F3" overflow="hidden" bind={{ "fills/0/color": "1074826698:35" }}>
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
  <Frame name="Layout / Skenovať kód" y={59} w={420} h={44}>
    <Frame name="Navigation / Skenovať kód" w={420} h={44} bg="#F4F6F3" bind={{ "fills/0/color": "1074826698:35" }}>
      <Text name="Text / Skenovať kód" x={86} y={12} w={248} h={24} color="#161D1C" size={17} font="Helvetica Neue" weight="bold" textAlign="center" textAutoResize="none" bind={{ "fills/0/color": "1074826698:36" }}>Skenovať kód</Text>
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
    <Frame name="Camera / Permission denied" flex="col" h={280} w="fill" justify="center" items="center" p={32} bg="#DDE4E1" rounded={24} bind={{ "fills/0/color": "1074826698:38" }}>
      <Frame name="Icon / camera" w={40} h={40}>
        <Frame name="Icon / Frame" w={40} h={40}>
          <Vector name="path" w={40} h={40} stroke="#3F4947" strokeWidth={2.8333333333333335} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
          <Vector name="path" w={40} h={40} stroke="#3F4947" strokeWidth={2.8333333333333335} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
        </Frame>
      </Frame>
      <Frame name="Space / 16" w={1} h={16} />
      <Text name="Text / Kamera nie je dostupná" w="fill" color="#161D1C" size={16} font="Helvetica Neue" weight="medium" textAlign="center" bind={{ "fills/0/color": "1074826698:36" }}>Kamera nie je dostupná</Text>
      <Frame name="Space / 8" w={1} h={8} />
      <Text name="Text / Povoľ kameru v nastaveniach zariadenia alebo zad" w="fill" color="#161D1C" font="Helvetica Neue" textAlign="center" bind={{ "fills/0/color": "1074826698:36" }}>Povoľ kameru v nastaveniach zariadenia alebo zadaj čiarový kód nižšie.</Text>
    </Frame>
    <Frame name="Space / 18" w={1} h={18} />
    <Text name="Text / Nasmeruj čiarový kód produktu do rámčeka." w="fill" color="#161D1C" font="Helvetica Neue" bind={{ "fills/0/color": "1074826698:36" }}>Nasmeruj čiarový kód produktu do rámčeka.</Text>
    <Frame name="Space / 28" w={1} h={28} />
    <Frame name="Layout / Čiarový kód" flex="col" w="fill">
      <Text name="Text / Čiarový kód" w="fill" color="#161D1C" font="Helvetica Neue" weight="medium" bind={{ "fills/0/color": "1074826698:36" }}>Čiarový kód</Text>
      <Frame name="Space / 8" w={1} h={8} />
      <Frame name="Field / Čiarový kód" flex="row" h={54} w="fill" items="center" p={15} bg="#FFFFFF" stroke="#BEC9C6" rounded={12} bind={{
        "fills/0/color": "1074826698:40",
        "strokes/0/color": "1074826698:44"
      }}>
        <Text name="Text / Empty field value" grow={1} color="#3F4947" size={16} font="Helvetica Neue" bind={{ "fills/0/color": "1074826698:37" }}>{" "}</Text>
      </Frame>
    </Frame>
    <Frame name="Space / 16" w={1} h={16} />
    <Frame name="iOS / Button / Primary" flex="row" h={52} w="fill" justify="center" items="center" bg="#147D73" rounded={14} bind={{ "fills/0/color": "1074826698:31" }}>
      <Text name="Text / Nájsť produkt" color="#FFFFFF" size={17} font="Helvetica Neue" weight="medium">Nájsť produkt</Text>
    </Frame>
    <Frame name="Space / 12" w={1} h={12} />
    <Frame name="IOS / Button / Secondary / light" flex="row" h={52} w="fill" justify="center" items="center" bg="#DDE4E1" rounded={14} bind={{ "fills/0/color": "1074826698:38" }}>
      <Text name="Text / Nájsť ručne" color="#161D1C" size={17} font="Helvetica Neue" weight="medium" bind={{ "fills/0/color": "1074826698:36" }}>Nájsť ručne</Text>
    </Frame>
  </Frame>
  <Frame name="09 · Skener — zamietnutá kamera / Frame" y={878} w={420} h={34}>
    <Frame name="System / Home indicator" w={420} h={34}>
      <Frame name="Rule / Divider" x={143} y={20} w={134} h={5} bg="#161D1C" rounded={3} bind={{ "fills/0/color": "1074826698:36" }} />
    </Frame>
  </Frame>
</Frame>