<Frame name="C · Offline a synchronizácia" y={1950} w={2040} h={740} bg="#F4F6F3" rounded={20}>
  <Frame name="Editable flow connectors" w={2040} h={740}>
    <Frame name="Connector 1 / segment 1" x={389} y={229} w={212} h={2} bg="#147D73" rounded={1} bind={{ "fills/0/color": "1074826698:31" }} />
    <Frame name="Connector 1 / arrowhead" x={589} y={222} w={16} h={16}>
      <Frame name="Connector 1 / Frame" w={16} h={16}>
        <Vector name="path" w={16} h={16} stroke="#147D73" strokeWidth={2} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
      </Frame>
    </Frame>
    <Frame name="Connector 2 / segment 1" x={969} y={229} w={302} h={2} bg="#147D73" rounded={1} bind={{ "fills/0/color": "1074826698:31" }} />
    <Frame name="Connector 2 / arrowhead" x={1259} y={222} w={16} h={16}>
      <Frame name="Connector 2 / Frame" w={16} h={16}>
        <Vector name="path" w={16} h={16} stroke="#147D73" strokeWidth={2} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
      </Frame>
    </Frame>
    <Frame name="Connector 3 / segment 1" x={784} y={295} w={2} h={146} bg="#147D73" rounded={1} bind={{ "fills/0/color": "1074826698:31" }} />
    <Frame name="Connector 3 / segment 2" x={784} y={439} w={302} h={2} bg="#147D73" rounded={1} bind={{ "fills/0/color": "1074826698:31" }} />
    <Frame name="Connector 3 / segment 3" x={1084} y={229} w={2} h={212} bg="#147D73" rounded={1} bind={{ "fills/0/color": "1074826698:31" }} />
    <Frame name="Connector 3 / segment 4" x={969} y={229} w={117} h={2} bg="#147D73" rounded={1} bind={{ "fills/0/color": "1074826698:31" }} />
    <Frame name="Connector 3 / arrowhead" x={966} y={222} w={16} h={16}>
      <Frame name="Connector 3 / Frame" w={16} h={16}>
        <Vector name="path" w={16} h={16} stroke="#147D73" strokeWidth={2} strokeAlign="center" strokeCap="round" strokeJoin="round" constraints={{ horizontal: "scale", vertical: "scale" }} />
      </Frame>
    </Frame>
  </Frame>
  <Text name="Text / Odoslať" x={435} y={190} w={260} color="#147D73" weight="medium">Odoslať</Text>
  <Text name="Text / Dostupné pripojenie rovnaké ID požiadavky" x={1000} y={175} w={260} color="#147D73" weight="medium">{"Dostupné pripojenie\nrovnaké ID požiadavky"}</Text>
  <Text name="Text / Zlyhanie siete → zostáva vo fronte" x={804} y={453} w={260} color="#147D73" weight="medium">Zlyhanie siete → zostáva vo fronte</Text>
  <Frame name="C01 / Rozpracovaná" x={50} y={165} w={340} h={132} bg="#FFFFFF" stroke="#BEC9C6" rounded={18}>
    <Text name="Text / C01" x={20} y={16} color="#147D73" size={12} weight="bold">C01</Text>
    <Text name="Text / Rozpracovaná" x={20} y={40} w={300} color="#161D1C" size={21} weight={600}>Rozpracovaná</Text>
    <Text name="Text / Počty sú uložené lokálne, vrátane explicitných n" x={20} y={83} w={300} color="#3F4947" size={12} lineHeight={17}>Počty sú uložené lokálne, vrátane explicitných núl.</Text>
  </Frame>
  <Frame name="C02 / Čaká na odoslanie" x={600} y={165} w={370} h={132} bg="#FFF5E8" stroke="#BEC9C6" rounded={18}>
    <Text name="Text / C02" x={20} y={16} color="#147D73" size={12} weight="bold">C02</Text>
    <Text name="Text / Čaká na odoslanie" x={20} y={40} w={330} color="#161D1C" size={21} weight={600}>Čaká na odoslanie</Text>
    <Text name="Text / Súpis je uzamknutý. Opakovanie nevytvorí dupliká" x={20} y={83} w={330} color="#3F4947" size={12} lineHeight={17}>Súpis je uzamknutý. Opakovanie nevytvorí duplikát.</Text>
  </Frame>
  <Frame name="C03 / Dokončená" x={1270} y={165} w={480} h={132} bg="#147D73" stroke="#BEC9C6" rounded={18}>
    <Text name="Text / C03" x={20} y={16} color="#DFFFAB" size={12} weight="bold">C03</Text>
    <Text name="Text / Dokončená" x={20} y={40} w={440} color="#FFFFFF" size={21} weight={600}>Dokončená</Text>
    <Text name="Text / Nemenný záznam inventúry. Katalógový stav sa nep" x={20} y={83} w={440} color="#FFFFFF" size={12} lineHeight={17}>Nemenný záznam inventúry. Katalógový stav sa neprepisuje.</Text>
  </Frame>
  <Text name="Text / C / OFFLINE, SYNCHRONIZÁCIA A KATALÓG" x={50} y={35} color="#161D1C" size={30} weight="bold">C / OFFLINE, SYNCHRONIZÁCIA A KATALÓG</Text>
  <Text name="Text / Obnoviť katalóg aktualizuje iba podklad pre nové" x={50} y={550} w={1830} color="#161D1C" size={19} weight="medium">Obnoviť katalóg aktualizuje iba podklad pre nové inventúry. Staré súpisy si zachovajú pôvodný snapshot.</Text>
  <Text name="Text / Zmena katalógu alebo strata prístupu → zrozumite" x={50} y={610} w={1830} color="#3F4947" size={17} lineHeight={26}>{"Zmena katalógu alebo strata prístupu → zrozumiteľná chyba; lokálna práca zostáva zachovaná.\nSpráva zásob a administrátorské schválenie nie sú súčasťou aktuálnej aplikácie."}</Text>
  <Text name="Text / Späť: Účet → Úvod  ·  Nastavenia / Nová → Invent" x={50} y={695} w={1830} color="#3F4947" size={17}>Späť: Účet → Úvod  ·  Nastavenia / Nová → Inventúry  ·  Skener / Kontrola → Detail</Text>
</Frame>