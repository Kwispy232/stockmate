<Frame name="07 · Produkty — posunutý zoznam" y={1240} w={420} h={912} bg="#F4F6F3" overflow="hidden" bind={{ "fills/0/color": "1074826698:35" }}>
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
      <Frame name="Icon / trash" x={380} y={11} w={24} h={24}>
        <Frame name="Icon / Frame" w={24} h={24}>
          <Vector name="path" w={24} h={24} stroke="#147D73" strokeWidth={1.7} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
        </Frame>
      </Frame>
      <Frame name="Rule / Divider" y={43} w={420} h={1} bg="#BEC9C6" bind={{ "fills/0/color": "1074826698:44" }} />
    </Frame>
  </Frame>
  <Frame name="Content / scroll" x={24} y={127} flex="col" w={372}>
    <Frame name="Layout / Hľadať produkt alebo kód" flex="col" w="fill">
      <Text name="Text / Hľadať produkt alebo kód" w="fill" color="#161D1C" font="Helvetica Neue" weight="medium" bind={{ "fills/0/color": "1074826698:36" }}>Hľadať produkt alebo kód</Text>
      <Frame name="Space / 8" w={1} h={8} />
      <Frame name="Field / Hľadať produkt alebo kód" flex="row" h={54} w="fill" items="center" p={15} bg="#FFFFFF" stroke="#BEC9C6" rounded={12} bind={{
        "fills/0/color": "1074826698:40",
        "strokes/0/color": "1074826698:44"
      }}>
        <Text name="Text / Empty field value" grow={1} color="#3F4947" size={16} font="Helvetica Neue" bind={{ "fills/0/color": "1074826698:37" }}>{" "}</Text>
      </Frame>
    </Frame>
    <Frame name="Space / 16" w={1} h={16} />
    <Frame name="Layout / Všetky" flex="row" h={40} w="fill" gap={8} items="center">
      <Frame name="Filter / Všetky" flex="row" h={40} items="center" py={0} px={12} bg="#147D73" rounded={12} bind={{ "fills/0/color": "1074826698:31" }}>
        <Text name="Text / Všetky" color="#FFFFFF" font="Helvetica Neue" weight="medium" bind={{ "fills/0/color": "1074826698:32" }}>Všetky</Text>
      </Frame>
      <Frame name="Filter / Nespočítané" flex="row" h={40} items="center" py={0} px={12} bg="#DDE4E1" rounded={12} bind={{ "fills/0/color": "1074826698:38" }}>
        <Text name="Text / Nespočítané" color="#161D1C" font="Helvetica Neue" weight="medium" bind={{ "fills/0/color": "1074826698:36" }}>Nespočítané</Text>
      </Frame>
      <Frame name="Filter / Rozdiely" flex="row" h={40} items="center" py={0} px={12} bg="#DDE4E1" rounded={12} bind={{ "fills/0/color": "1074826698:38" }}>
        <Text name="Text / Rozdiely" color="#161D1C" font="Helvetica Neue" weight="medium" bind={{ "fills/0/color": "1074826698:36" }}>Rozdiely</Text>
      </Frame>
    </Frame>
    <Frame name="Space / 20" w={1} h={20} />
    <Frame name="Product / SM-001" flex="col" w="fill" p={16} bg="#FFFFFF" stroke="#BEC9C6" strokeWidth={0.6} rounded={20} bind={{
      "fills/0/color": "1074826698:40",
      "strokes/0/color": "1074826698:44"
    }}>
      <Frame name="Layout / Coffee beans 250 g" flex="row" w="fill" gap={14} items="center">
        <Frame name="Frame / Frame" flex="row" w={42} h={42} justify="center" items="center" bg="#9EF2E6" rounded={12} bind={{ "fills/0/color": "1074826698:33" }}>
          <Frame name="Icon / check" w={22} h={22}>
            <Frame name="Icon / Frame" w={22} h={22}>
              <Vector name="path" w={22} h={22} stroke="#147D73" strokeWidth={1.5583333333333331} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
            </Frame>
          </Frame>
        </Frame>
        <Frame name="Layout / Coffee beans 250 g" flex="col" grow={1}>
          <Text name="Text / Coffee beans 250 g" w="fill" color="#161D1C" font="Helvetica Neue" weight="medium" bind={{ "fills/0/color": "1074826698:36" }}>Coffee beans 250 g</Text>
          <Frame name="Space / 5" w={1} h={5} />
          <Text name="Text / SM-001 · Evidované: 12" w="fill" color="#161D1C" size={12} font="Helvetica Neue" bind={{ "fills/0/color": "1074826698:36" }}>SM-001 · Evidované: 12</Text>
        </Frame>
        <Text name="Text / 8" color="#161D1C" size={22} font="Helvetica Neue" weight="bold" bind={{ "fills/0/color": "1074826698:36" }}>8</Text>
        <Frame name="Icon / chevron" w={18} h={18}>
          <Frame name="Icon / Frame" w={18} h={18}>
            <Vector name="path" w={18} h={18} stroke="#3F4947" strokeWidth={1.275} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
          </Frame>
        </Frame>
      </Frame>
    </Frame>
    <Frame name="Space / 8" w={1} h={8} />
    <Frame name="Product / SM-002" flex="col" w="fill" p={16} bg="#FFFFFF" stroke="#BEC9C6" strokeWidth={0.6} rounded={20} bind={{
      "fills/0/color": "1074826698:40",
      "strokes/0/color": "1074826698:44"
    }}>
      <Frame name="Layout / Green tea 20 bags" flex="row" w="fill" gap={14} items="center">
        <Frame name="Frame / Frame" flex="row" w={42} h={42} justify="center" items="center" bg="#DDE4E1" rounded={12} bind={{ "fills/0/color": "1074826698:38" }}>
          <Frame name="Icon / box" w={22} h={22}>
            <Frame name="Icon / Frame" w={22} h={22}>
              <Vector name="path" w={22} h={22} stroke="#147D73" strokeWidth={1.5583333333333331} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
            </Frame>
          </Frame>
        </Frame>
        <Frame name="Layout / Green tea 20 bags" flex="col" grow={1}>
          <Text name="Text / Green tea 20 bags" w="fill" color="#161D1C" font="Helvetica Neue" weight="medium" bind={{ "fills/0/color": "1074826698:36" }}>Green tea 20 bags</Text>
          <Frame name="Space / 5" w={1} h={5} />
          <Text name="Text / SM-002 · Evidované: 18" w="fill" color="#161D1C" size={12} font="Helvetica Neue" bind={{ "fills/0/color": "1074826698:36" }}>SM-002 · Evidované: 18</Text>
        </Frame>
        <Text name="Text / —" color="#161D1C" size={22} font="Helvetica Neue" weight="bold" bind={{ "fills/0/color": "1074826698:36" }}>—</Text>
        <Frame name="Icon / chevron" w={18} h={18}>
          <Frame name="Icon / Frame" w={18} h={18}>
            <Vector name="path" w={18} h={18} stroke="#3F4947" strokeWidth={1.275} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
          </Frame>
        </Frame>
      </Frame>
    </Frame>
    <Frame name="Space / 8" w={1} h={8} />
    <Frame name="Product / SM-003" flex="col" w="fill" p={16} bg="#FFFFFF" stroke="#BEC9C6" strokeWidth={0.6} rounded={20} bind={{
      "fills/0/color": "1074826698:40",
      "strokes/0/color": "1074826698:44"
    }}>
      <Frame name="Layout / Oat drink 1 l" flex="row" w="fill" gap={14} items="center">
        <Frame name="Frame / Frame" flex="row" w={42} h={42} justify="center" items="center" bg="#9EF2E6" rounded={12} bind={{ "fills/0/color": "1074826698:33" }}>
          <Frame name="Icon / check" w={22} h={22}>
            <Frame name="Icon / Frame" w={22} h={22}>
              <Vector name="path" w={22} h={22} stroke="#147D73" strokeWidth={1.5583333333333331} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
            </Frame>
          </Frame>
        </Frame>
        <Frame name="Layout / Oat drink 1 l" flex="col" grow={1}>
          <Text name="Text / Oat drink 1 l" w="fill" color="#161D1C" font="Helvetica Neue" weight="medium" bind={{ "fills/0/color": "1074826698:36" }}>Oat drink 1 l</Text>
          <Frame name="Space / 5" w={1} h={5} />
          <Text name="Text / SM-003 · Evidované: 16" w="fill" color="#161D1C" size={12} font="Helvetica Neue" bind={{ "fills/0/color": "1074826698:36" }}>SM-003 · Evidované: 16</Text>
        </Frame>
        <Text name="Text / 16" color="#161D1C" size={22} font="Helvetica Neue" weight="bold" bind={{ "fills/0/color": "1074826698:36" }}>16</Text>
        <Frame name="Icon / chevron" w={18} h={18}>
          <Frame name="Icon / Frame" w={18} h={18}>
            <Vector name="path" w={18} h={18} stroke="#3F4947" strokeWidth={1.275} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
          </Frame>
        </Frame>
      </Frame>
    </Frame>
    <Frame name="Space / 8" w={1} h={8} />
    <Frame name="Product / SM-004" flex="col" w="fill" p={16} bg="#FFFFFF" stroke="#BEC9C6" strokeWidth={0.6} rounded={20} bind={{
      "fills/0/color": "1074826698:40",
      "strokes/0/color": "1074826698:44"
    }}>
      <Frame name="Layout / Sparkling water 1.5 l" flex="row" w="fill" gap={14} items="center">
        <Frame name="Frame / Frame" flex="row" w={42} h={42} justify="center" items="center" bg="#9EF2E6" rounded={12} bind={{ "fills/0/color": "1074826698:33" }}>
          <Frame name="Icon / check" w={22} h={22}>
            <Frame name="Icon / Frame" w={22} h={22}>
              <Vector name="path" w={22} h={22} stroke="#147D73" strokeWidth={1.5583333333333331} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
            </Frame>
          </Frame>
        </Frame>
        <Frame name="Layout / Sparkling water 1.5 l" flex="col" grow={1}>
          <Text name="Text / Sparkling water 1.5 l" w="fill" color="#161D1C" font="Helvetica Neue" weight="medium" bind={{ "fills/0/color": "1074826698:36" }}>Sparkling water 1.5 l</Text>
          <Frame name="Space / 5" w={1} h={5} />
          <Text name="Text / SM-004 · Evidované: 24" w="fill" color="#161D1C" size={12} font="Helvetica Neue" bind={{ "fills/0/color": "1074826698:36" }}>SM-004 · Evidov