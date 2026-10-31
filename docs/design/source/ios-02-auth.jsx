<Frame name="02 · Prihlásenie a registrácia / auth" x={520} y={140} w={420} h={912} bg="#F4F6F3" overflow="hidden" bind={{ "fills/0/color": "1074826698:35" }}>
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
  <Frame name="Layout / Prihlásiť sa" y={59} w={420} h={44}>
    <Frame name="Navigation / Prihlásiť sa" w={420} h={44} bg="#F4F6F3" bind={{ "fills/0/color": "1074826698:35" }}>
      <Text name="Text / Prihlásiť sa" x={86} y={12} w={248} h={24} color="#161D1C" size={17} font="Helvetica Neue" weight="bold" textAlign="center" textAutoResize="none" bind={{ "fills/0/color": "1074826698:36" }}>Prihlásiť sa</Text>
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
    <Frame name="Space / 20" w={1} h={20} />
    <Frame name="Content / Frame" flex="row" h={64} w="fill" justify="center">
      <Frame name="StockMate / Original SVG" w={64} h={64}>
        <Frame name="StockMate / Frame" w={64} h={64}>
          <Vector name="path" w={64} h={64} bg="#147D73" constraints={{ horizontal: "scale", vertical: "scale" }} />
          <Vector name="path" w={64} h={64} stroke="#FFFFFF" strokeWidth={2.6666666666666665} strokeAlign="center" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
          <Vector name="path" w={64} h={64} stroke="#FFFFFF" strokeWidth={2.6666666666666665} strokeAlign="center" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
          <Vector name="path" w={64} h={64} bg="#DFFFAB" constraints={{ horizontal: "scale", vertical: "scale" }} />
          <Vector name="path" w={64} h={64} stroke="#11564F" strokeWidth={2.6666666666666665} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
        </Frame>
      </Frame>
    </Frame>
    <Frame name="Space / 28" w={1} h={28} />
    <Frame name="Layout / Email" flex="col" w="fill">
      <Text name="Text / Email" w="fill" color="#161D1C" font="Helvetica Neue" weight="medium" bind={{ "fills/0/color": "1074826698:36" }}>Email</Text>
      <Frame name="Space / 8" w={1} h={8} />
      <Frame name="Field / Email" flex="row" h={54} w="fill" items="center" p={15} bg="#FFFFFF" stroke="#BEC9C6" rounded={12} bind={{
        "fills/0/color": "1074826698:40",
        "strokes/0/color": "1074826698:44"
      }}>
        <Text name="Text / meno@priklad.sk" grow={1} color="#3F4947" size={16} font="Helvetica Neue" bind={{ "fills/0/color": "1074826698:37" }}>meno@priklad.sk</Text>
      </Frame>
    </Frame>
    <Frame name="Space / 20" w={1} h={20} />
    <Frame name="Layout / Heslo" flex="col" w="fill">
      <Text name="Text / Heslo" w="fill" color="#161D1C" font="Helvetica Neue" weight="medium" bind={{ "fills/0/color": "1074826698:36" }}>Heslo</Text>
      <Frame name="Space / 8" w={1} h={8} />
      <Frame name="Field / Heslo" flex="row" h={54} w="fill" items="center" py={5} px={12} bg="#FFFFFF" stroke="#BEC9C6" rounded={12} bind={{
        "fills/0/color": "1074826698:40",
        "strokes/0/color": "1074826698:44"
      }}>
        <Text name="Text / Aspoň 6 znakov" grow={1} color="#3F4947" size={16} font="Helvetica Neue" bind={{ "fills/0/color": "1074826698:37" }}>Aspoň 6 znakov</Text>
        <Frame name="Password / Show password button" flex="row" w={44} h={44} justify="center" items="center">
          <Frame name="Icon / Show password" w={24} h={24}>
            <Frame name="custom" w={24} h={24}>
              <Vector name="path" w={24} h={24} stroke="#147D73" strokeWidth={1.7} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
            </Frame>
          </Frame>
        </Frame>
      </Frame>
    </Frame>
    <Frame name="Space / 24" w={1} h={24} />
    <Frame name="iOS / Button / Primary" flex="row" h={52} w="fill" justify="center" items="center" bg="#147D73" rounded={14} bind={{ "fills/0/color": "1074826698:31" }}>
      <Text name="Text / Prihlásiť sa" color="#FFFFFF" size={17} font="Helvetica Neue" weight="medium">Prihlásiť sa</Text>
    </Frame>
    <Frame name="Space / 12" w={1} h={12} />
    <Frame name="IOS / Button / Secondary / light" flex="row" h={52} w="fill" justify="center" items="center" bg="#DDE4E1" rounded={14} bind={{ "fills/0/color": "1074826698:38" }}>
      <Text name="Text / Vytvoriť účet" color="#161D1C" size={17} font="Helvetica Neue" weight="medium" bind={{ "fills/0/color": "1074826698:36" }}>Vytvoriť účet</Text>
    </Frame>
  </Frame>
  <Frame name="02 · Prihlásenie a registrácia / Frame" y={878} w={420} h={34}>
    <Frame name="System / Home indicator" w={420} h={34}>
      <Frame name="Rule / Divider" x={143} y={20} w={134} h={5} bg="#161D1C" rounded={3} bind={{ "fills/0/color": "1074826698:36" }} />
    </Frame>
  </Frame>
</Frame>