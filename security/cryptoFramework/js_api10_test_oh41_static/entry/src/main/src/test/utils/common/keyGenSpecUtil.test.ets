/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import cpFw from '@ohos.security.cryptoFramework';
import cryptoFramework from '@ohos.security.cryptoFramework';

export function genSM2KeySpec(keyType: cpFw.AsyKeySpecType): cpFw.AsyKeySpec {
  let eccCommonSpec = SM2CommonSpec();
  switch (keyType) {
    case cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC:
      return eccCommonSpec;
    case cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC:
      let eccPriKeySpec: cpFw.ECCPriKeySpec = {
        algName: "SM2",
        specType: cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC,
        params: eccCommonSpec,
        sk: SM2Sk(),
      };
      return eccPriKeySpec;
    case cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC:
      let eccPubKeySpec: cpFw.ECCPubKeySpec = {
        algName: "SM2",
        specType: cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC,
        params: eccCommonSpec,
        pk: SM2Pk(),
      };
      return eccPubKeySpec;
    case cpFw.AsyKeySpecType.KEY_PAIR_SPEC:
      let eccKeyPairSpec: cpFw.ECCKeyPairSpec = {
        algName: "SM2",
        specType: cpFw.AsyKeySpecType.KEY_PAIR_SPEC,
        params: eccCommonSpec,
        sk: SM2Sk(),
        pk: SM2Pk(),
      };
      return eccKeyPairSpec;
  }

  return eccCommonSpec;
}

export function SM2CommonSpec(): cpFw.ECCCommonParamsSpec {
  let fieldFp: cpFw.ECFieldFp = {
    fieldType: "Fp",
    p: BigInt("115792089210356248756420345214020892766250353991924191454421193933289684991999"),
  };

  let G: cpFw.Point = {
    x: BigInt("22963146547237050559479531362550074578802567295341616970375194840604139615431"),
    y: BigInt("85132369209828568825618990617112496413088388631904505083283536607588877201568"),
  };

  let sm2CommonSpec: cpFw.ECCCommonParamsSpec = {
    algName: "SM2",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    field: fieldFp,
    a: BigInt("115792089210356248756420345214020892766250353991924191454421193933289684991996"),
    b: BigInt("18505919022281880113072981827955639221458448578012075254857346196103069175443"),
    g: G,
    n: BigInt("115792089210356248756420345214020892766061623724957744567843809356293439045923"),
    h: 1,
  };
  return sm2CommonSpec;
}

export function SM2Sk() {
  return BigInt('44865034034753528279576865928075303946258226058363947036220155068824166297716');
}

export function SM2Pk() {
  let pk: cpFw.Point = {
    x: BigInt('47018839338924435050110785031351759007822306695053504711021879526595239871172'),
    y: BigInt('96133091491756192384849037905113087024675932328759814704074462890629083635825')
  };
  return pk;
}

export function genECC224KeySpec(keyType: cpFw.AsyKeySpecType): cpFw.AsyKeySpec {
  let eccCommonSpec = ecc224Spec();
  switch (keyType) {
    case cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC:
      return eccCommonSpec;
    case cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC:
      let eccPriKeySpec: cpFw.ECCPriKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC,
        params: eccCommonSpec,
        sk: ecc224Sk(),
      };
      return eccPriKeySpec;
    case cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC:
      let eccPubKeySpec: cpFw.ECCPubKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC,
        params: eccCommonSpec,
        pk: ecc224Pk(),
      };
      return eccPubKeySpec;
    case cpFw.AsyKeySpecType.KEY_PAIR_SPEC:
      let eccKeyPairSpec: cpFw.ECCKeyPairSpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.KEY_PAIR_SPEC,
        params: eccCommonSpec,
        sk: ecc224Sk(),
        pk: ecc224Pk(),
      };
      return eccKeyPairSpec;
  }
  return eccCommonSpec;
}

export function ecc224Spec(): cpFw.ECCCommonParamsSpec {
  let fieldFp: cpFw.ECFieldFp = {
    fieldType: "Fp",
    p: BigInt("26959946667150639794667015087019630673557916260026308143510066298881"),
  };

  let G: cpFw.Point = {
    x: BigInt("19277929113566293071110308034699488026831934219452440156649784352033"),
    y: BigInt("19926808758034470970197974370888749184205991990603949537637343198772"),
  };

  let ecc224CommonSpec: cpFw.ECCCommonParamsSpec = {
    algName: "EC",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    field: fieldFp,
    a: BigInt("26959946667150639794667015087019630673557916260026308143510066298878"),
    b: BigInt("18958286285566608000408668544493926415504680968679321075787234672564"),
    g: G,
    n: BigInt("26959946667150639794667015087019625940457807714424391721682722368061"),
    h: 1,
  };
  return ecc224CommonSpec;
}

export function ecc224Sk(): bigint {
  return BigInt('11441234719405267299913123667882052845517227166554152176592534113831');
}

export function ecc224Pk(): cpFw.Point {
  let pk: cpFw.Point = {
    x: BigInt('9933409198359223831966785652278746621062612881631827887358154092313'),
    y: BigInt('21710845406273745977738863861547180504529271958272821243435422319017')
  }
  return pk;
}

export function genECC256KeySpec(keyType: cpFw.AsyKeySpecType): cpFw.AsyKeySpec {
  let eccCommonSpec = ecc256Spec();
  switch (keyType) {
    case cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC:
      return eccCommonSpec;
    case cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC:
      let eccPriKeySpec: cpFw.ECCPriKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC,
        params: eccCommonSpec,
        sk: ecc256Sk(),
      };
      return eccPriKeySpec;
    case cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC:
      let eccPubKeySpec: cpFw.ECCPubKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC,
        params: eccCommonSpec,
        pk: ecc256Pk(),
      };
      return eccPubKeySpec;
    case cpFw.AsyKeySpecType.KEY_PAIR_SPEC:
      let eccKeyPairSpec: cpFw.ECCKeyPairSpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.KEY_PAIR_SPEC,
        params: eccCommonSpec,
        sk: ecc256Sk(),
        pk: ecc256Pk(),
      };
      return eccKeyPairSpec;
  }

  return eccCommonSpec;
}

export function ecc256Spec(): cpFw.ECCCommonParamsSpec {
  let fieldFp: cpFw.ECFieldFp = {
    fieldType: "Fp",
    p: BigInt("115792089210356248762697446949407573530086143415290314195533631308867097853951"),
  };

  let G: cpFw.Point = {
    x: BigInt("48439561293906451759052585252797914202762949526041747995844080717082404635286"),
    y: BigInt("36134250956749795798585127919587881956611106672985015071877198253568414405109"),
  };

  let ecc256CommonSpec: cpFw.ECCCommonParamsSpec = {
    algName: "EC",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    field: fieldFp,
    a: BigInt("115792089210356248762697446949407573530086143415290314195533631308867097853948"),
    b: BigInt("41058363725152142129326129780047268409114441015993725554835256314039467401291"),
    g: G,
    n: BigInt("115792089210356248762697446949407573529996955224135760342422259061068512044369"),
    h: 1,
  };
  return ecc256CommonSpec;
}

export function ecc256Sk(): bigint {
  return BigInt('6970207122749681592346511706153186988398072067736549186305188949488183017932');
}

export function ecc256Pk(): cpFw.Point {
  let pk: cpFw.Point = {
    x: BigInt('29952127005934129419466979769663209082109781539412630855175836496222198254106'),
    y: BigInt('101377480134776485296587713793771299967635457891414328326793094955994388485073')
  }
  return pk;
}

export function genECC384KeySpec(keyType: cpFw.AsyKeySpecType): cpFw.AsyKeySpec {
  let eccCommonSpec = ecc384Spec();
  switch (keyType) {
    case cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC:
      return eccCommonSpec;
    case cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC:
      let eccPriKeySpec: cpFw.ECCPriKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC,
        params: eccCommonSpec,
        sk: ecc384Sk(),
      };
      return eccPriKeySpec;
    case cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC:
      let eccPubKeySpec: cpFw.ECCPubKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC,
        params: eccCommonSpec,
        pk: ecc384Pk(),
      };
      return eccPubKeySpec;
    case cpFw.AsyKeySpecType.KEY_PAIR_SPEC:
      let eccKeyPairSpec: cpFw.ECCKeyPairSpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.KEY_PAIR_SPEC,
        params: eccCommonSpec,
        sk: ecc384Sk(),
        pk: ecc384Pk(),
      };
      return eccKeyPairSpec;
  }

  return eccCommonSpec;
}

export function ecc384Spec(): cpFw.ECCCommonParamsSpec {
  let fieldFp: cpFw.ECFieldFp = {
    fieldType: "Fp",
    p: BigInt("39402006196394479212279040100143613805079739270465446667948293404245721771496870329047266088258938001861606973112319"),
  };

  let G: cpFw.Point = {
    x: BigInt("26247035095799689268623156744566981891852923491109213387815615900925518854738050089022388053975719786650872476732087"),
    y: BigInt("8325710961489029985546751289520108179287853048861315594709205902480503199884419224438643760392947333078086511627871"),
  };

  let ecc384CommonSpec: cpFw.ECCCommonParamsSpec = {
    algName: "EC",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    field: fieldFp,
    a: BigInt("39402006196394479212279040100143613805079739270465446667948293404245721771496870329047266088258938001861606973112316"),
    b: BigInt("27580193559959705877849011840389048093056905856361568521428707301988689241309860865136260764883745107765439761230575"),
    g: G,
    n: BigInt("39402006196394479212279040100143613805079739270465446667946905279627659399113263569398956308152294913554433653942643"),
    h: 1,
  };
  return ecc384CommonSpec;
}

export function ecc384Sk(): bigint {
  return BigInt('22585525756278759613149574431554415486603265063115498699630587039368412887016008626719570502256791367074769404142624');
}

export function ecc384Pk(): cpFw.Point {
  let pk: cpFw.Point = {
    x: BigInt('10340028794844263031369651958155971508644706309187346130352064477030100460813606768340791820300213648679970694108749'),
    y: BigInt('37513038523786302144457297529250538617020889585357511572978047078829678338291979028612392396122913878021120059636')
  }
  return pk;
}

export function genECC521KeySpec(keyType: cpFw.AsyKeySpecType): cpFw.AsyKeySpec {
  let eccCommonSpec = ecc521Spec();
  switch (keyType) {
    case cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC:
      return eccCommonSpec;
    case cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC:
      let eccPriKeySpec: cpFw.ECCPriKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC,
        params: eccCommonSpec,
        sk: ecc521Sk(),
      };
      return eccPriKeySpec;
    case cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC:
      let eccPubKeySpec: cpFw.ECCPubKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC,
        params: eccCommonSpec,
        pk: ecc521Pk(),
      };
      return eccPubKeySpec;
    case cpFw.AsyKeySpecType.KEY_PAIR_SPEC:
      let eccKeyPairSpec: cpFw.ECCKeyPairSpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.KEY_PAIR_SPEC,
        params: eccCommonSpec,
        sk: ecc521Sk(),
        pk: ecc521Pk(),
      };
      return eccKeyPairSpec;
  }

  return eccCommonSpec;
}

export function ecc521Spec(): cpFw.ECCCommonParamsSpec {
  let fieldFp: cpFw.ECFieldFp = {
    fieldType: "Fp",
    p: BigInt("6864797660130609714981900799081393217269435300143305409394463459185543183397656052122559640661454554977296311391480858037121987999716643812574028291115057151"),
  };

  let G: cpFw.Point = {
    x: BigInt("2661740802050217063228768716723360960729859168756973147706671368418802944996427808491545080627771902352094241225065558662157113545570916814161637315895999846"),
    y: BigInt("3757180025770020463545507224491183603594455134769762486694567779615544477440556316691234405012945539562144444537289428522585666729196580810124344277578376784"),
  };

  let ecc521CommonSpec: cpFw.ECCCommonParamsSpec = {
    algName: "EC",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    field: fieldFp,
    a: BigInt("6864797660130609714981900799081393217269435300143305409394463459185543183397656052122559640661454554977296311391480858037121987999716643812574028291115057148"),
    b: BigInt("1093849038073734274511112390766805569936207598951683748994586394495953116150735016013708737573759623248592132296706313309438452531591012912142327488478985984"),
    g: G,
    n: BigInt("6864797660130609714981900799081393217269435300143305409394463459185543183397655394245057746333217197532963996371363321113864768612440380340372808892707005449"),
    h: 1,
  };
  return ecc521CommonSpec;
}

export function ecc521Sk(): bigint {
  return BigInt('3313820070107365330249312646257924607731922691117933758076139539614926022341218781393995348782543963893508684918200134030380816867302691254996591754073054340');
}

export function ecc521Pk(): cpFw.Point {
  let pk: cpFw.Point = {
    x: BigInt('6177228356860337504885366878090885528710618705757433353121025589075603667114305990160469048541425475881874677813590870233162846698855386734690815610692225144'),
    y: BigInt('1074254744323596763553235036486456818769338065031491618044720703327018042558958218810003129147750364742547391677066385607616898931937639618614486600148672765')
  }
  return pk;
}

export function genP160r1KeySpec(keyType: cpFw.AsyKeySpecType): cpFw.AsyKeySpec {
  let eccCommonSpec = p160r1Spec();
  switch (keyType) {
    case cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC:
      return eccCommonSpec;
    case cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC:
      let eccPriKeySpec: cpFw.ECCPriKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC,
        params: eccCommonSpec,
        sk: p160r1Sk(),
      };
      return eccPriKeySpec;
    case cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC:
      let eccPubKeySpec: cpFw.ECCPubKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC,
        params: eccCommonSpec,
        pk: p160r1Pk(),
      };
      return eccPubKeySpec;
    case cpFw.AsyKeySpecType.KEY_PAIR_SPEC:
      let eccKeyPairSpec: cpFw.ECCKeyPairSpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.KEY_PAIR_SPEC,
        params: eccCommonSpec,
        sk: p160r1Sk(),
        pk: p160r1Pk(),
      };
      return eccKeyPairSpec;
  }

  return eccCommonSpec;
}

export function p160r1Spec(): cpFw.ECCCommonParamsSpec {
  let fieldFp: cpFw.ECFieldFp = {
    fieldType: "Fp",
    p: BigInt("1332297598440044874827085558802491743757193798159"),
  };

  let G: cpFw.Point = {
    x: BigInt("1089473557631435284577962539738532515920566082499"),
    y: BigInt("127912481829969033206777085249718746721365418785"),
  };

  let p160rCommonSpec: cpFw.ECCCommonParamsSpec = {
    algName: "ECC",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    field: fieldFp,
    a: BigInt("297190522446607939568481567949428902921613329152"),
    b: BigInt("173245649450172891208247283053495198538671808088"),
    g: G,
    n: BigInt("1332297598440044874827085038830181364212942568457"),
    h: 1,
  };
  return p160rCommonSpec;
}

export function p160r1Sk(): bigint {
  return BigInt('269815265467673728005393773781106246164827198581');
}

export function p160r1Pk(): cpFw.Point {
  let pk: cpFw.Point = {
    x: BigInt('1268852140563600595511927788734983005777679684458'),
    y: BigInt('768575598001191042862335656406956028732181766805')
  }
  return pk;
}

export function genP160t1KeySpec(keyType: cpFw.AsyKeySpecType): cpFw.AsyKeySpec {
  let eccCommonSpec = p160t1Spec();
  switch (keyType) {
    case cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC:
      return eccCommonSpec;
    case cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC:
      let eccPriKeySpec: cpFw.ECCPriKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC,
        params: eccCommonSpec,
        sk: p160t1Sk(),
      };
      return eccPriKeySpec;
    case cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC:
      let eccPubKeySpec: cpFw.ECCPubKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC,
        params: eccCommonSpec,
        pk: p160t1Pk(),
      };
      return eccPubKeySpec;
    case cpFw.AsyKeySpecType.KEY_PAIR_SPEC:
      let eccKeyPairSpec: cpFw.ECCKeyPairSpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.KEY_PAIR_SPEC,
        params: eccCommonSpec,
        sk: p160t1Sk(),
        pk: p160t1Pk(),
      };
      return eccKeyPairSpec;
  }

  return eccCommonSpec;
}

export function p160t1Spec(): cpFw.ECCCommonParamsSpec {
  let fieldFp: cpFw.ECFieldFp = {
    fieldType: "Fp",
    p: BigInt("1332297598440044874827085558802491743757193798159"),
  };

  let G: cpFw.Point = {
    x: BigInt("1013918819608769552616977083272059630517089149816"),
    y: BigInt("992437653978037713070561264469524978381944905901"),
  };

  let p160tCommonSpec: cpFw.ECCCommonParamsSpec = {
    algName: "ECC",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    field: fieldFp,
    a: BigInt("1332297598440044874827085558802491743757193798156"),
    b: BigInt("698401795719474705027684479972917623041381757824"),
    g: G,
    n: BigInt("1332297598440044874827085038830181364212942568457"),
    h: 1,
  };
  return p160tCommonSpec;
}

export function p160t1Sk() {
  return BigInt('835560399146372622117193689115794292014909837661');
}

export function p160t1Pk() {
  let pk: cpFw.Point = {
    x: BigInt('605217150549886093543092663079577619982423807725'),
    y: BigInt('681117932618959496154214774355668711642852935549')
  }
  return pk;
}

export function genP192r1KeySpec(keyType: cpFw.AsyKeySpecType): cpFw.AsyKeySpec {
  let eccCommonSpec = p192r1Spec();
  switch (keyType) {
    case cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC:
      return eccCommonSpec;
    case cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC:
      let eccPriKeySpec: cpFw.ECCPriKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC,
        params: eccCommonSpec,
        sk: p192r1Sk(),
      };
      return eccPriKeySpec;
    case cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC:
      let eccPubKeySpec: cpFw.ECCPubKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC,
        params: eccCommonSpec,
        pk: p192r1Pk(),
      };
      return eccPubKeySpec;
    case cpFw.AsyKeySpecType.KEY_PAIR_SPEC:
      let eccKeyPairSpec: cpFw.ECCKeyPairSpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.KEY_PAIR_SPEC,
        params: eccCommonSpec,
        sk: p192r1Sk(),
        pk: p192r1Pk(),
      };
      return eccKeyPairSpec;
  }

  return eccCommonSpec;
}

export function p192r1Spec(): cpFw.ECCCommonParamsSpec {
  let fieldFp: cpFw.ECFieldFp = {
    fieldType: "Fp",
    p: BigInt("4781668983906166242955001894344923773259119655253013193367"),
  };

  let G: cpFw.Point = {
    x: BigInt("4723188856514392935399337699153522173525168621081341681622"),
    y: BigInt("507884783101387741749746950209061101579755255809652136847"),
  };

  let p192rCommonSpec: cpFw.ECCCommonParamsSpec = {
    algName: "ECC",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    field: fieldFp,
    a: BigInt("2613009377683017747869391908421543348309181741502784219375"),
    b: BigInt("1731160591135112004210203499537764623771657619977468323273"),
    g: G,
    n: BigInt("4781668983906166242955001894269038308119863659119834868929"),
    h: 1,
  };
  return p192rCommonSpec;
}

export function p192r1Sk() {
  return BigInt('2756427981079110034492933236818515386965505888180500430693');
}

export function p192r1Pk() {
  let pk: cpFw.Point = {
    x: BigInt('3975126387492156722832965845435860361299504677711208309133'),
    y: BigInt('4392516481637366595230592969834321503317852045519313048340')
  }
  return pk;
}

export function genP192t1KeySpec(keyType: cpFw.AsyKeySpecType): cpFw.AsyKeySpec {
  let eccCommonSpec = p192t1Spec();
  switch (keyType) {
    case cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC:
      return eccCommonSpec;
    case cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC:
      let eccPriKeySpec: cpFw.ECCPriKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC,
        params: eccCommonSpec,
        sk: p192t1Sk(),
      };
      return eccPriKeySpec;
    case cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC:
      let eccPubKeySpec: cpFw.ECCPubKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC,
        params: eccCommonSpec,
        pk: p192t1Pk(),
      };
      return eccPubKeySpec;
    case cpFw.AsyKeySpecType.KEY_PAIR_SPEC:
      let eccKeyPairSpec: cpFw.ECCKeyPairSpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.KEY_PAIR_SPEC,
        params: eccCommonSpec,
        sk: p192t1Sk(),
        pk: p192t1Pk(),
      };
      return eccKeyPairSpec;
  }

  return eccCommonSpec;
}

export function p192t1Spec(): cpFw.ECCCommonParamsSpec {
  let fieldFp: cpFw.ECFieldFp = {
    fieldType: "Fp",
    p: BigInt("4781668983906166242955001894344923773259119655253013193367"),
  };

  let G: cpFw.Point = {
    x: BigInt("1444558712667280506885530592978306040338136913835324440873"),
    y: BigInt("232764348904945951820395534722141373682806994795615748553"),
  };

  let p192tCommonSpec: cpFw.ECCCommonParamsSpec = {
    algName: "ECC",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    field: fieldFp,
    a: BigInt("4781668983906166242955001894344923773259119655253013193364"),
    b: BigInt("486321888066950067394881041525590797530120076120499518329"),
    g: G,
    n: BigInt("4781668983906166242955001894269038308119863659119834868929"),
    h: 1,
  };
  return p192tCommonSpec;
}

export function p192t1Sk() {
  return BigInt('2965954370038418266251694284344880358794669902444460980748');
}

export function p192t1Pk() {
  let pk: cpFw.Point = {
    x: BigInt('2720864020698932064255813847005221384076081741075560255976'),
    y: BigInt('1600803317275629825157592267019151419020026351180204357571')
  }
  return pk;
}

export function genP224r1KeySpec(keyType: cpFw.AsyKeySpecType): cpFw.AsyKeySpec {
  let eccCommonSpec = p224r1Spec();
  switch (keyType) {
    case cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC:
      return eccCommonSpec;
    case cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC:
      let eccPriKeySpec: cpFw.ECCPriKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC,
        params: eccCommonSpec,
        sk: p224r1Sk(),
      };
      return eccPriKeySpec;
    case cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC:
      let eccPubKeySpec: cpFw.ECCPubKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC,
        params: eccCommonSpec,
        pk: p224r1Pk(),
      };
      return eccPubKeySpec;
    case cpFw.AsyKeySpecType.KEY_PAIR_SPEC:
      let eccKeyPairSpec: cpFw.ECCKeyPairSpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.KEY_PAIR_SPEC,
        params: eccCommonSpec,
        sk: p224r1Sk(),
        pk: p224r1Pk(),
      };
      return eccKeyPairSpec;
  }

  return eccCommonSpec;
}

export function p224r1Spec(): cpFw.ECCCommonParamsSpec {
  let fieldFp: cpFw.ECFieldFp = {
    fieldType: "Fp",
    p: BigInt("22721622932454352787552537995910928073340732145944992304435472941311"),
  };

  let G: cpFw.Point = {
    x: BigInt("1428364927244201726431498207475486496993067267318520844137448783997"),
    y: BigInt("9337555360448823227812410753177468631215558779020518084752618816205"),
  };

  let p224rCommonSpec: cpFw.ECCCommonParamsSpec = {
    algName: "ECC",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    field: fieldFp,
    a: BigInt("11020725272625742361946480833014344015343456918668456061589001510723"),
    b: BigInt("3949606626053374030787926457695139766118442946052311411513528958987"),
    g: G,
    n: BigInt("22721622932454352787552537995910923612567546342330757191396560966559"),
    h: 1,
  };
  return p224rCommonSpec;
}

export function p224r1Sk() {
  return BigInt('3806644622477799587939321209349183298900993533505682661803493910216');
}

export function p224r1Pk() {
  let pk: cpFw.Point = {
    x: BigInt('20756525920378240192162272571677482881552470935567659695328796937005'),
    y: BigInt('4417192360134751750557877515607981596383398533911614343007691427283')
  }
  return pk;
}

export function genP224t1KeySpec(keyType: cpFw.AsyKeySpecType): cpFw.AsyKeySpec {
  let eccCommonSpec = p224t1Spec();
  switch (keyType) {
    case cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC:
      return eccCommonSpec;
    case cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC:
      let eccPriKeySpec: cpFw.ECCPriKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC,
        params: eccCommonSpec,
        sk: p224t1Sk(),
      };
      return eccPriKeySpec;
    case cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC:
      let eccPubKeySpec: cpFw.ECCPubKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC,
        params: eccCommonSpec,
        pk: p224t1Pk(),
      };
      return eccPubKeySpec;
    case cpFw.AsyKeySpecType.KEY_PAIR_SPEC:
      let eccKeyPairSpec: cpFw.ECCKeyPairSpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.KEY_PAIR_SPEC,
        params: eccCommonSpec,
        sk: p224t1Sk(),
        pk: p224t1Pk(),
      };
      return eccKeyPairSpec;
  }

  return eccCommonSpec;
}

export function p224t1Spec(): cpFw.ECCCommonParamsSpec {
  let fieldFp: cpFw.ECFieldFp = {
    fieldType: "Fp",
    p: BigInt("22721622932454352787552537995910928073340732145944992304435472941311"),
  };

  let G: cpFw.Point = {
    x: BigInt("11236281700362234642592534287151572422539408672654616227474732012928"),
    y: BigInt("364032462118593425315751587028126980694396626774408344039871404876"),
  };

  let p224tCommonSpec: cpFw.ECCCommonParamsSpec = {
    algName: "ECC",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    field: fieldFp,
    a: BigInt("22721622932454352787552537995910928073340732145944992304435472941308"),
    b: BigInt("7919603849831377222129533323916957959225380016698795812027476510861"),
    g: G,
    n: BigInt("22721622932454352787552537995910923612567546342330757191396560966559"),
    h: 1,
  };
  return p224tCommonSpec;
}

export function p224t1Sk() {
  return BigInt('20690918374266917460070521022888810285190074025526171764569198870108');
}

export function p224t1Pk() {
  let pk: cpFw.Point = {
    x: BigInt('14474015952205930057628790754176550803019853568999257242479232710442'),
    y: BigInt('18790899808145571704666125526235664290655140752256246933674244859445')
  }
  return pk;
}

export function genP256r1KeySpec(keyType: cpFw.AsyKeySpecType): cpFw.AsyKeySpec {
  let eccCommonSpec = p256r1Spec();
  switch (keyType) {
    case cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC:
      return eccCommonSpec;
    case cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC:
      let eccPriKeySpec: cpFw.ECCPriKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC,
        params: eccCommonSpec,
        sk: p256r1Sk(),
      };
      return eccPriKeySpec;
    case cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC:
      let eccPubKeySpec: cpFw.ECCPubKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC,
        params: eccCommonSpec,
        pk: p256r1Pk(),
      };
      return eccPubKeySpec;
    case cpFw.AsyKeySpecType.KEY_PAIR_SPEC:
      let eccKeyPairSpec: cpFw.ECCKeyPairSpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.KEY_PAIR_SPEC,
        params: eccCommonSpec,
        sk: p256r1Sk(),
        pk: p256r1Pk(),
      };
      return eccKeyPairSpec;
  }

  return eccCommonSpec;
}

export function p256r1Spec(): cpFw.ECCCommonParamsSpec {
  let fieldFp: cpFw.ECFieldFp = {
    fieldType: "Fp",
    p: BigInt("76884956397045344220809746629001649093037950200943055203735601445031516197751"),
  };

  let G: cpFw.Point = {
    x: BigInt("63243729749562333355292243550312970334778175571054726587095381623627144114786"),
    y: BigInt("38218615093753523893122277964030810387585405539772602581557831887485717997975"),
  };

  let p256rCommonSpec: cpFw.ECCCommonParamsSpec = {
    algName: "ECC",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    field: fieldFp,
    a: BigInt("56698187605326110043627228396178346077120614539475214109386828188763884139993"),
    b: BigInt("17577232497321838841075697789794520262950426058923084567046852300633325438902"),
    g: G,
    n: BigInt("76884956397045344220809746629001649092737531784414529538755519063063536359079"),
    h: 1,
  };
  return p256rCommonSpec;
}

export function p256r1Sk() {
  return BigInt('22836598277690058392560351062518619702810373996514999709759427490511706553218');
}

export function p256r1Pk() {
  let pk: cpFw.Point = {
    x: BigInt('17504078193353594193752012916028778703689807994335513634093615909217896522099'),
    y: BigInt('14260252413934198441341601866837334286671422263465884160771015020873475550696')
  }
  return pk;
}

export function genP256t1KeySpec(keyType: cpFw.AsyKeySpecType): cpFw.AsyKeySpec {
  let eccCommonSpec = p256t1Spec();
  switch (keyType) {
    case cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC:
      return eccCommonSpec;
    case cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC:
      let eccPriKeySpec: cpFw.ECCPriKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC,
        params: eccCommonSpec,
        sk: p256t1Sk(),
      };
      return eccPriKeySpec;
    case cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC:
      let eccPubKeySpec: cpFw.ECCPubKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC,
        params: eccCommonSpec,
        pk: p256t1Pk(),
      };
      return eccPubKeySpec;
    case cpFw.AsyKeySpecType.KEY_PAIR_SPEC:
      let eccKeyPairSpec: cpFw.ECCKeyPairSpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.KEY_PAIR_SPEC,
        params: eccCommonSpec,
        sk: p256t1Sk(),
        pk: p256t1Pk(),
      };
      return eccKeyPairSpec;
  }

  return eccCommonSpec;
}

export function p256t1Spec(): cpFw.ECCCommonParamsSpec {
  let fieldFp: cpFw.ECFieldFp = {
    fieldType: "Fp",
    p: BigInt("76884956397045344220809746629001649093037950200943055203735601445031516197751"),
  };

  let G: cpFw.Point = {
    x: BigInt("74138526386500101787937404544159543470173440588427591213843535686338908194292"),
    y: BigInt("20625154686056605250529482107801269759951443923312408063441227608803066104254"),
  };

  let p256tCommonSpec: cpFw.ECCCommonParamsSpec = {
    algName: "ECC",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    field: fieldFp,
    a: BigInt("76884956397045344220809746629001649093037950200943055203735601445031516197748"),
    b: BigInt("46214326585032579593829631435610129746736367449296220983687490401182983727876"),
    g: G,
    n: BigInt("76884956397045344220809746629001649092737531784414529538755519063063536359079"),
    h: 1,
  };
  return p256tCommonSpec;
}

export function p256t1Sk() {
  return BigInt('29483422044606394648293018053199506540603110660388718150195451465379776489364');
}

export function p256t1Pk() {
  let pk: cpFw.Point = {
    x: BigInt('76088055169071581591977731013047245347130605334139202627911466896097587213882'),
    y: BigInt('26112934567225819548558418423211062379408214037644251225120943183765416073919')
  }
  return pk;
}

export function genP320r1KeySpec(keyType: cpFw.AsyKeySpecType): cpFw.AsyKeySpec {
  let eccCommonSpec = p320r1Spec();
  switch (keyType) {
    case cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC:
      return eccCommonSpec;
    case cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC:
      let eccPriKeySpec: cpFw.ECCPriKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC,
        params: eccCommonSpec,
        sk: p320r1Sk(),
      };
      return eccPriKeySpec;
    case cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC:
      let eccPubKeySpec: cpFw.ECCPubKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC,
        params: eccCommonSpec,
        pk: p320r1Pk(),
      };
      return eccPubKeySpec;
    case cpFw.AsyKeySpecType.KEY_PAIR_SPEC:
      let eccKeyPairSpec: cpFw.ECCKeyPairSpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.KEY_PAIR_SPEC,
        params: eccCommonSpec,
        sk: p320r1Sk(),
        pk: p320r1Pk(),
      };
      return eccKeyPairSpec;
  }

  return eccCommonSpec;
}

export function p320r1Spec(): cpFw.ECCCommonParamsSpec {
  let fieldFp: cpFw.ECFieldFp = {
    fieldType: "Fp",
    p: BigInt("1763593322239166354161909842446019520889512772719515192772960415288640868802149818095501499903527"),
  };

  let G: cpFw.Point = {
    x: BigInt("565203972584199378547773331021708157952136817703497461781479793049434111597020229546183313458705"),
    y: BigInt("175146432689526447697480803229621572834859050903464782210773312572877763380340633688906597830369"),
  };

  let p320rCommonSpec: cpFw.ECCCommonParamsSpec = {
    algName: "ECC",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    field: fieldFp,
    a: BigInt("524709318439392693105919717518043758943240164412117372990311331314771510648804065756354311491252"),
    b: BigInt("684460840191207052139729091116995410883497412720006364295713596062999867796741135919289734394278"),
    g: G,
    n: BigInt("1763593322239166354161909842446019520889512772717686063760686124016784784845843468355685258203921"),
    h: 1,
  };
  return p320rCommonSpec;
}

export function p320r1Sk() {
  return BigInt('324352007326792807994514316470495427468205305756484412112301665335758511933758806101347033184881');
}

export function p320r1Pk() {
  let pk: cpFw.Point = {
    x: BigInt('978144546163016285209705577036035970923824499294519214589984588197666491220018286221403913761387'),
    y: BigInt('138117930629822868158097622427967181896001907125466394016880334884064729228057175906511712798101')
  }
  return pk;
}

export function genP320t1KeySpec(keyType: cpFw.AsyKeySpecType): cpFw.AsyKeySpec {
  let eccCommonSpec = p320t1Spec();
  switch (keyType) {
    case cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC:
      return eccCommonSpec;
    case cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC:
      let eccPriKeySpec: cpFw.ECCPriKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC,
        params: eccCommonSpec,
        sk: p320t1Sk(),
      };
      return eccPriKeySpec;
    case cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC:
      let eccPubKeySpec: cpFw.ECCPubKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC,
        params: eccCommonSpec,
        pk: p320t1Pk(),
      };
      return eccPubKeySpec;
    case cpFw.AsyKeySpecType.KEY_PAIR_SPEC:
      let eccKeyPairSpec: cpFw.ECCKeyPairSpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.KEY_PAIR_SPEC,
        params: eccCommonSpec,
        sk: p320t1Sk(),
        pk: p320t1Pk(),
      };
      return eccKeyPairSpec;
  }

  return eccCommonSpec;
}

export function p320t1Spec(): cpFw.ECCCommonParamsSpec {
  let fieldFp: cpFw.ECFieldFp = {
    fieldType: "Fp",
    p: BigInt("1763593322239166354161909842446019520889512772719515192772960415288640868802149818095501499903527"),
  };

  let G: cpFw.Point = {
    x: BigInt("1221175819973001316491038958226563119032598033059331804921649457916311604176688737745420093746514"),
    y: BigInt("832095900618272253462376182163435186143818309959785348829039065198217071225345202726924484399811"),
  };

  let p320tCommonSpec: cpFw.ECCCommonParamsSpec = {
    algName: "ECC",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    field: fieldFp,
    a: BigInt("1763593322239166354161909842446019520889512772719515192772960415288640868802149818095501499903524"),
    b: BigInt("1401395435032847536924656852322353441447762422733674743806973258207878888547540276867732868432723"),
    g: G,
    n: BigInt("1763593322239166354161909842446019520889512772717686063760686124016784784845843468355685258203921"),
    h: 1,
  };
  return p320tCommonSpec;
}

export function p320t1Sk() {
  return BigInt('1289377834028165814368139043980099725670188730394587332392510035991823909808362875701629247877408');
}

export function p320t1Pk() {
  let pk: cpFw.Point = {
    x: BigInt('1731196332735841654578234823385344907291551946051025476998427197683463989200381237783883929189910'),
    y: BigInt('1531713943258675190075767561856948505225064023102106413099966585067843482440982658024632230080429')
  }
  return pk;
}

export function genP384r1KeySpec(keyType: cpFw.AsyKeySpecType): cpFw.AsyKeySpec {
  let eccCommonSpec = p384r1Spec();
  switch (keyType) {
    case cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC:
      return eccCommonSpec;
    case cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC:
      let eccPriKeySpec: cpFw.ECCPriKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC,
        params: eccCommonSpec,
        sk: p384r1Sk(),
      };
      return eccPriKeySpec;
    case cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC:
      let eccPubKeySpec: cpFw.ECCPubKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC,
        params: eccCommonSpec,
        pk: p384r1Pk(),
      };
      return eccPubKeySpec;
    case cpFw.AsyKeySpecType.KEY_PAIR_SPEC:
      let eccKeyPairSpec: cpFw.ECCKeyPairSpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.KEY_PAIR_SPEC,
        params: eccCommonSpec,
        sk: p384r1Sk(),
        pk: p384r1Pk(),
      };
      return eccKeyPairSpec;
  }

  return eccCommonSpec;
}

export function p384r1Spec(): cpFw.ECCCommonParamsSpec {
  let fieldFp: cpFw.ECFieldFp = {
    fieldType: "Fp",
    p: BigInt("21659270770119316173069236842332604979796116387017648600081618503821089934025961822236561982844534088440708417973331"),
  };

  let G: cpFw.Point = {
    x: BigInt("4480579927441533893329522230328287337018133311029754539518372936441756157459087304048546502931308754738349656551198"),
    y: BigInt("21354446258743982691371413536748675410974765754620216137225614281636810686961198361153695003859088327367976229294869"),
  };

  let p384rCommonSpec: cpFw.ECCCommonParamsSpec = {
    algName: "ECC",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    field: fieldFp,
    a: BigInt("19048979039598244295279281525021548448223459855185222892089532512446337024935426033638342846977861914875721218402342"),
    b: BigInt("717131854892629093329172042053689661426642816397448020844407951239049616491589607702456460799758882466071646850065"),
    g: G,
    n: BigInt("21659270770119316173069236842332604979796116387017648600075645274821611501358515537962695117368903252229601718723941"),
    h: 1,
  };
  return p384rCommonSpec;
}

export function p384r1Sk() {
  return BigInt('17548441785502243044604382894876187140364265667459522262987689025055374932276630200072750166553898231532232388033499');
}

export function p384r1Pk() {
  let pk: cpFw.Point = {
    x: BigInt('4228128761019858647210979572042537680254811250647787099005610699619762288461660301804407035886731046415396181932413'),
    y: BigInt('16577923215920079649174410460443373894083776412145800058814982100850199276702060173574050256781650410203260078194591')
  }
  return pk;
}

export function genP384t1KeySpec(keyType: cpFw.AsyKeySpecType): cpFw.AsyKeySpec {
  let eccCommonSpec = p384t1Spec();
  switch (keyType) {
    case cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC:
      return eccCommonSpec;
    case cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC:
      let eccPriKeySpec: cpFw.ECCPriKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC,
        params: eccCommonSpec,
        sk: p384t1Sk(),
      };
      return eccPriKeySpec;
    case cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC:
      let eccPubKeySpec: cpFw.ECCPubKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC,
        params: eccCommonSpec,
        pk: p384t1Pk(),
      };
      return eccPubKeySpec;
    case cpFw.AsyKeySpecType.KEY_PAIR_SPEC:
      let eccKeyPairSpec: cpFw.ECCKeyPairSpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.KEY_PAIR_SPEC,
        params: eccCommonSpec,
        sk: p384t1Sk(),
        pk: p384t1Pk(),
      };
      return eccKeyPairSpec;
  }

  return eccCommonSpec;
}

export function p384t1Spec(): cpFw.ECCCommonParamsSpec {
  let fieldFp: cpFw.ECFieldFp = {
    fieldType: "Fp",
    p: BigInt("21659270770119316173069236842332604979796116387017648600081618503821089934025961822236561982844534088440708417973331"),
  };

  let G: cpFw.Point = {
    x: BigInt("3827769047710394604076870463731979903132904572714069494181204655675960538951736634566672590576020545838501853661388"),
    y: BigInt("5797643717699939326787282953388004860198302425468870641753455602553471777319089854136002629714659021021358409132328"),
  };

  let p384tCommonSpec: cpFw.ECCCommonParamsSpec = {
    algName: "ECC",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    field: fieldFp,
    a: BigInt("21659270770119316173069236842332604979796116387017648600081618503821089934025961822236561982844534088440708417973328"),
    b: BigInt("19596161053329239268181228455226581162286252326261019516900162717091837027531392576647644262320816848087868142547438"),
    g: G,
    n: BigInt("21659270770119316173069236842332604979796116387017648600075645274821611501358515537962695117368903252229601718723941"),
    h: 1,
  };
  return p384tCommonSpec;
}

export function p384t1Sk() {
  return BigInt('4919969514549793550378424778168227978892968267064968203453080285748354764119519912445983736719434621838130520709599');
}

export function p384t1Pk() {
  let pk: cpFw.Point = {
    x: BigInt('20770248817982632159363388480598603871876099786033474928291909183626115504947147902494970880931807004641736758478689'),
    y: BigInt('7737572847023932071249377864372832770430031676194319838565305844847041064362479250980415550985380440059617224993589')
  }
  return pk;
}

export function genP512r1KeySpec(keyType: cpFw.AsyKeySpecType): cpFw.AsyKeySpec {
  let eccCommonSpec = p512r1Spec();
  switch (keyType) {
    case cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC:
      return eccCommonSpec;
    case cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC:
      let eccPriKeySpec: cpFw.ECCPriKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC,
        params: eccCommonSpec,
        sk: p512r1Sk(),
      };
      return eccPriKeySpec;
    case cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC:
      let eccPubKeySpec: cpFw.ECCPubKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC,
        params: eccCommonSpec,
        pk: p512r1Pk(),
      };
      return eccPubKeySpec;
    case cpFw.AsyKeySpecType.KEY_PAIR_SPEC:
      let eccKeyPairSpec: cpFw.ECCKeyPairSpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.KEY_PAIR_SPEC,
        params: eccCommonSpec,
        sk: p512r1Sk(),
        pk: p512r1Pk(),
      };
      return eccKeyPairSpec;
  }

  return eccCommonSpec;
}

export function p512r1Spec(): cpFw.ECCCommonParamsSpec {
  let fieldFp: cpFw.ECFieldFp = {
    fieldType: "Fp",
    p: BigInt("8948962207650232551656602815159153422162609644098354511344597187200057010413552439917934304191956942765446530386427345937963894309923928536070534607816947"),
  };

  let G: cpFw.Point = {
    x: BigInt("6792059140424575174435640431269195087843153390102521881468023012732047482579853077545647446272866794936371522410774532686582484617946013928874296844351522"),
    y: BigInt("6592244555240112873324748381429610341312712940326266331327445066687010545415256461097707483288650216992613090185042957716318301180159234788504307628509330"),
  };

  let p512rCommonSpec: cpFw.ECCCommonParamsSpec = {
    algName: "ECC",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    field: fieldFp,
    a: BigInt("6294860557973063227666421306476379324074715770622746227136910445450301914281276098027990968407983962691151853678563877834221834027439718238065725844264138"),
    b: BigInt("3245789008328967059274849584342077916531909009637501918328323668736179176583263496463525128488282611559800773506973771797764811498834995234341530862286627"),
    g: G,
    n: BigInt("8948962207650232551656602815159153422162609644098354511344597187200057010413418528378981730643524959857451398370029280583094215613882043973354392115544169"),
    h: 1,
  };
  return p512rCommonSpec;
}

export function p512r1Sk() {
  return BigInt('1935795402999824334563982601263084872927997743670557527265900338410032441816574808110250192986979946556388901518165981770863699474312721846488646889486874');
}

export function p512r1Pk() {
  let pk: cpFw.Point = {
    x: BigInt('8330880792568123463225975602413244739349456480247292759865770605219039889232580405234450328510090079535147338573585347019585207761052398652005394391118424'),
    y: BigInt('4440739507751568460045629505006875925043121049962445962049654837275520481880194612847256977445171936680678866313764196065529808644102943766367302404171950')
  }
  return pk;
}

export function genP512t1KeySpec(keyType: cpFw.AsyKeySpecType): cryptoFramework.AsyKeySpec {
  let eccCommonSpec = p512t1Spec();
  switch (keyType) {
    case cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC:
      return eccCommonSpec;
    case cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC:
      let eccPriKeySpec: cpFw.ECCPriKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC,
        params: eccCommonSpec,
        sk: p512t1Sk(),
      };
      return eccPriKeySpec;
    case cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC:
      let eccPubKeySpec: cpFw.ECCPubKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC,
        params: eccCommonSpec,
        pk: p512t1Pk(),
      };
      return eccPubKeySpec;
    case cpFw.AsyKeySpecType.KEY_PAIR_SPEC:
      let eccKeyPairSpec: cpFw.ECCKeyPairSpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.KEY_PAIR_SPEC,
        params: eccCommonSpec,
        sk: p512t1Sk(),
        pk: p512t1Pk(),
      };
      return eccKeyPairSpec;
  }

  return eccCommonSpec;
}

export function p512t1Spec(): cpFw.ECCCommonParamsSpec {
  let fieldFp: cpFw.ECFieldFp = {
    fieldType: "Fp",
    p: BigInt("8948962207650232551656602815159153422162609644098354511344597187200057010413552439917934304191956942765446530386427345937963894309923928536070534607816947"),
  };

  let G: cpFw.Point = {
    x: BigInt("5240454105373391383446315535930423532243726242869439206480578543706358506399554673205583372921814351137736817888782671966171301927338369930113338349467098"),
    y: BigInt("4783098043208509222858478731459039446855297686825168822962919559100076900387655035060042118755576220187973470126780576052258118403094460341772613532037938"),
  };

  let p512tCommonSpec: cpFw.ECCCommonParamsSpec = {
    algName: "ECC",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    field: fieldFp,
    a: BigInt("8948962207650232551656602815159153422162609644098354511344597187200057010413552439917934304191956942765446530386427345937963894309923928536070534607816944"),
    b: BigInt("6532815740455945129522030162820444801309011444717674409730083343052139800841847092116476221316466234404847931899409316558007222582458822004777353814164030"),
    g: G,
    n: BigInt("8948962207650232551656602815159153422162609644098354511344597187200057010413418528378981730643524959857451398370029280583094215613882043973354392115544169"),
    h: 1,
  };
  return p512tCommonSpec;
}

export function p512t1Sk() {
  return BigInt('5111165368611878023696203452985469550734187238026431970308176187788266391044285184486422456966866672831921228228097232439999587187757769536240468499256084');
}

export function p512t1Pk() {
  let pk: cpFw.Point = {
    x: BigInt('2372538399176825467212498120869258478271830690188320031540893046298787386813296172706008260006346243258753733764841153131987782519049364329833233371109924'),
    y: BigInt('2772204852882534149465216478907374752093033823854199927415176257960311634851307074319729721258500194834336065856049584159445680874467269707057597332278740')
  }
  return pk;
}

export function genDHKeySpec(keyType: cpFw.AsyKeySpecType): cpFw.AsyKeySpec {
  let dhCommonSpec: cpFw.DHCommonParamsSpec = {
    algName: "DH",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    p: BigInt('143883237485096911523396260343874089950395473408245779790642390636084277049324487320765691613066352917481944547405689677246280152410758013777025889764765692851384451416319617692425991236335855348677315061390272265742624033974422711563743651130853053024311390237925287317451474937241063690707505697001705975527'),
    g: BigInt('2'),
    l: 512,
  }
  switch (keyType) {
    case cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC:
      return dhCommonSpec;
    case cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC:
      let dhPriKeySpec: cpFw.DHPriKeySpec = {
        algName: "DH",
        specType: cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC,
        params: dhCommonSpec,
        sk: dhSk()
      };
      return dhPriKeySpec;
    case cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC:
      let dhPubKeySpec: cpFw.DHPubKeySpec = {
        algName: "DH",
        specType: cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC,
        params: dhCommonSpec,
        pk: dhPk()
      };
      return dhPubKeySpec;
    case cpFw.AsyKeySpecType.KEY_PAIR_SPEC:
      let dhKeyPairSpec: cpFw.DHKeyPairSpec = {
        algName: "DH",
        specType: cpFw.AsyKeySpecType.KEY_PAIR_SPEC,
        params: dhCommonSpec,
        sk: dhSk(),
        pk: dhPk()
      };
      return dhKeyPairSpec;
  }

  return dhCommonSpec;
}

export function dhSk() {
  return BigInt('26338314196010394003047705826246263763817858777633584257903027929486581399289');
}

export function dhPk() {
  return BigInt('88526073542684289740553502784855485761717378867878721325430646321401727693216');
}

export function genEd25519KeySpec(keyType: cpFw.AsyKeySpecType): cpFw.AsyKeySpec {
  switch (keyType) {
    case cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC:
      let ed25519PriKeySpec: cpFw.ED25519PriKeySpec = {
        algName: "Ed25519",
        specType: cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC,
        sk: ed25519Sk(),
      };
      return ed25519PriKeySpec;
    case cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC:
      let ed25519PubKeySpec: cpFw.ED25519PubKeySpec = {
        algName: "Ed25519",
        specType: cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC,
        pk: ed25519Pk(),
      };
      return ed25519PubKeySpec;
    case cpFw.AsyKeySpecType.KEY_PAIR_SPEC:
      let ed25519KeyPairSpec: cpFw.ED25519KeyPairSpec = {
        algName: "Ed25519",
        specType: cpFw.AsyKeySpecType.KEY_PAIR_SPEC,
        sk: ed25519Sk(),
        pk: ed25519Pk(),
      };
      return ed25519KeyPairSpec;
    default:
      let defaultSpec: cpFw.ED25519KeyPairSpec = {
        algName: "Ed25519",
        specType: cpFw.AsyKeySpecType.KEY_PAIR_SPEC,
        sk: ed25519Sk(),
        pk: ed25519Pk(),
      };
      return defaultSpec;
  }
}

export function ed25519Sk() {
  return BigInt('26338314196010394003047705826246263763817858777633584257903027929486581399289');
}

export function ed25519Pk() {
  return BigInt('88526073542684289740553502784855485761717378867878721325430646321401727693216');
}

export function genX25519KeySpec(keyType: cpFw.AsyKeySpecType): cpFw.AsyKeySpec {
  switch (keyType) {
    case cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC:
      let x25519PriKeySpec: cpFw.X25519PriKeySpec = {
        algName: "X25519",
        specType: cpFw.AsyKeySpecType.PRIVATE_KEY_SPEC,
        sk: x25519Sk(),
      };
      return x25519PriKeySpec;
    case cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC:
      let x25519PubKeySpec: cpFw.X25519PubKeySpec = {
        algName: "X25519",
        specType: cpFw.AsyKeySpecType.PUBLIC_KEY_SPEC,
        pk: x25519Pk(),
      };
      return x25519PubKeySpec;
    case cpFw.AsyKeySpecType.KEY_PAIR_SPEC:
      let x25519KeyPairSpec: cpFw.X25519KeyPairSpec = {
        algName: "X25519",
        specType: cpFw.AsyKeySpecType.KEY_PAIR_SPEC,
        sk: x25519Sk(),
        pk: x25519Pk(),
      };
      return x25519KeyPairSpec;
    default:
      let defaultSpec: cpFw.X25519KeyPairSpec = {
        algName: "X25519",
        specType: cpFw.AsyKeySpecType.KEY_PAIR_SPEC,
        sk: x25519Sk(),
        pk: x25519Pk(),
      };
      return defaultSpec;
  }
}

export function x25519Sk() {
  return BigInt('80492519743984536410287031417673280832731199941643693694014394451502905215291');
}

export function x25519Pk() {
  return BigInt('29236918585986399753398384668566812412856019336455282363269457131759906074454');
}

export function genAsn1DataFunc() {
  let dataBlob: cpFw.DataBlob = {
    data: new Uint8Array([48, 118, 2, 32, 45, 153, 88, 82, 104, 221, 226, 43, 174, 21, 122, 248, 5, 232, 105, 41, 92,
      95, 102, 224, 216, 149, 85, 236, 110, 6, 64, 188, 149, 70, 70, 183, 2, 32, 107, 93, 198, 247, 119, 18, 40, 110,
      90, 156, 193, 158, 205, 113, 170, 128, 146, 109, 75, 17, 181, 109, 110, 91, 149, 5, 110, 233, 209, 78, 229, 96,
      4, 32, 87, 167, 167, 247, 88, 146, 203, 234, 83, 126, 117, 129, 52, 142, 82, 54, 152, 226, 201, 111, 143, 115,
      169, 125, 128, 42, 157, 31, 114, 198, 109, 244, 4, 14, 100, 227, 78, 195, 249, 179, 43, 70, 242, 69, 169, 10,
      65, 123])
  };
  return dataBlob;
}

export function genSM2CipherTextFunc(): cpFw.SM2CipherTextSpec {
  let spec: cpFw.SM2CipherTextSpec = {
    xCoordinate: BigInt('20625015362595980457695435345498579729138244358573902431560627260141789922999'),
    yCoordinate: BigInt('48563164792857017065725892921053777369510340820930241057309844352421738767712'),
    cipherTextData: new Uint8Array([100, 227, 78, 195, 249, 179, 43, 70, 242, 69, 169, 10, 65, 123]),
    hashData: new Uint8Array([87, 167, 167, 247, 88, 146, 203, 234, 83, 126, 117, 129, 52, 142, 82, 54, 152, 226, 201,
      111, 143, 115, 169, 125, 128, 42, 157, 31, 114, 198, 109, 244]),
  };
  return spec;
}

export enum AsyAlgName {
  ECC224 = "ECC224",
  ECC256 = "ECC256",
  ECC384 = "ECC384",
  ECC521 = "ECC521",
  P160r1 = "ECC_BrainPoolP160r1",
  P160t1 = "ECC_BrainPoolP160t1",
  P192r1 = "ECC_BrainPoolP192r1",
  P192t1 = "ECC_BrainPoolP192t1",
  P224r1 = "ECC_BrainPoolP224r1",
  P224t1 = "ECC_BrainPoolP224t1",
  P256r1 = "ECC_BrainPoolP256r1",
  P256t1 = "ECC_BrainPoolP256t1",
  P320r1 = "ECC_BrainPoolP320r1",
  P320t1 = "ECC_BrainPoolP320t1",
  P384r1 = "ECC_BrainPoolP384r1",
  P384t1 = "ECC_BrainPoolP384t1",
  P512r1 = "ECC_BrainPoolP512r1",
  P512t1 = "ECC_BrainPoolP512t1",
  SM2 = "SM2_256",
  ED25519 = "Ed25519",
  X25519 = "X25519",
}

export function genAsyKeySpec(algName: AsyAlgName, keyType: cpFw.AsyKeySpecType): cpFw.AsyKeySpec {
  switch (algName) {
    case AsyAlgName.ECC224:
      return genECC224KeySpec(keyType);
    case AsyAlgName.ECC256:
      return genECC256KeySpec(keyType);
    case AsyAlgName.ECC384:
      return genECC384KeySpec(keyType);
    case AsyAlgName.ECC521:
      return genECC521KeySpec(keyType);
    case AsyAlgName.P160r1:
      return genP160r1KeySpec(keyType);
    case AsyAlgName.P160t1:
      return genP160t1KeySpec(keyType);
    case AsyAlgName.P192r1:
      return genP192r1KeySpec(keyType);
    case AsyAlgName.P192t1:
      return genP192t1KeySpec(keyType);
    case AsyAlgName.P224r1:
      return genP224r1KeySpec(keyType);
    case AsyAlgName.P224t1:
      return genP224t1KeySpec(keyType);
    case AsyAlgName.P256r1:
      return genP256r1KeySpec(keyType);
    case AsyAlgName.P256t1:
      return genP256t1KeySpec(keyType);
    case AsyAlgName.P320r1:
      return genP320r1KeySpec(keyType);
    case AsyAlgName.P320t1:
      return genP320t1KeySpec(keyType);
    case AsyAlgName.P384r1:
      return genP384r1KeySpec(keyType);
    case AsyAlgName.P384t1:
      return genP384t1KeySpec(keyType);
    case AsyAlgName.P512r1:
      return genP512r1KeySpec(keyType);
    case AsyAlgName.P512t1:
      return genP512t1KeySpec(keyType);
    case AsyAlgName.SM2:
      return genSM2KeySpec(keyType);
    case AsyAlgName.ED25519:
      return genEd25519KeySpec(keyType);
    case AsyAlgName.X25519:
      return genX25519KeySpec(keyType);
    default:
      return genP256r1KeySpec(keyType);
  }
}

export function curveName(algName: AsyAlgName): string {
  switch (algName) {
    case AsyAlgName.ECC224:
      return "NID_secp224r1";
    case AsyAlgName.ECC256:
      return "NID_X9_62_prime256v1";
    case AsyAlgName.ECC384:
      return "NID_secp384r1";
    case AsyAlgName.ECC521:
      return "NID_secp521r1";
    case AsyAlgName.P160r1:
      return "NID_brainpoolP160r1";
    case AsyAlgName.P160t1:
      return "NID_brainpoolP160t1";
    case AsyAlgName.P192r1:
      return "NID_brainpoolP192r1";
    case AsyAlgName.P192t1:
      return "NID_brainpoolP192t1";
    case AsyAlgName.P224r1:
      return "NID_brainpoolP224r1";
    case AsyAlgName.P224t1:
      return "NID_brainpoolP224t1";
    case AsyAlgName.P256r1:
      return "NID_brainpoolP256r1";
    case AsyAlgName.P256t1:
      return "NID_brainpoolP256t1";
    case AsyAlgName.P320r1:
      return "NID_brainpoolP320r1";
    case AsyAlgName.P320t1:
      return "NID_brainpoolP320t1";
    case AsyAlgName.P384r1:
      return "NID_brainpoolP384r1";
    case AsyAlgName.P384t1:
      return "NID_brainpoolP384t1";
    case AsyAlgName.P512r1:
      return "NID_brainpoolP512r1";
    case AsyAlgName.P512t1:
      return "NID_brainpoolP512t1";
    case AsyAlgName.SM2:
      return "NID_sm2";
    default:
      return "NID_brainpoolP256r1";
  }
}

export function compressedKeyBlob(algName: AsyAlgName): cryptoFramework.DataBlob {
  let dataBlob: cryptoFramework.DataBlob = {
    data: new Uint8Array()
  };
  switch (algName) {
    case AsyAlgName.ECC224:
      dataBlob.data = new Uint8Array([48, 50, 48, 16, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 5, 43, 129, 4, 0, 33, 3,
        30, 0, 3, 94, 82, 199, 184, 99, 49, 188, 112, 196, 36, 13, 164, 248, 49, 214, 234, 184, 94, 44, 207, 130,
        65, 234, 133, 136, 235, 175, 25]);
      break;
    case AsyAlgName.ECC256:
      dataBlob.data = new Uint8Array([48, 57, 48, 19, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 8, 42, 134, 72, 206, 61,
        3, 1, 7, 3, 34, 0, 3, 66, 56, 77, 153, 42, 114, 250, 72, 19, 209, 151, 140, 8, 75, 220, 185, 110, 246, 123,
        189, 100, 3, 67, 166, 61, 139, 104, 226, 31, 209, 74, 26]);
      break;
    case AsyAlgName.ECC384:
      dataBlob.data = new Uint8Array([48, 70, 48, 16, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 5, 43, 129, 4, 0, 34, 3,
        50, 0, 2, 67, 46, 54, 188, 60, 116, 143, 214, 26, 252, 159, 175, 137, 186, 87, 18, 232, 229, 119, 234, 62,
        59, 194, 134, 252, 7, 205, 122, 90, 231, 139, 228, 11, 125, 25, 205, 136, 60, 141, 201, 166, 26, 101, 47,
        207, 214, 22, 77]);
      break;
    case AsyAlgName.ECC521:
      dataBlob.data = new Uint8Array([48, 88, 48, 16, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 5, 43, 129, 4, 0, 35, 3,
        68, 0, 3, 1, 204, 183, 255, 64, 184, 236, 36, 174, 193, 141, 213, 78, 170, 164, 38, 131, 121, 26, 196, 194,
        26, 129, 183, 163, 208, 148, 60, 131, 68, 22, 225, 113, 122, 233, 63, 19, 239, 61, 57, 192, 97, 225, 95, 19,
        36, 37, 194, 64, 128, 71, 28, 204, 140, 243, 167, 137, 194, 169, 122, 97, 79, 173, 146, 200, 120]);
      break;
    case AsyAlgName.P160r1:
      dataBlob.data = new Uint8Array([48, 46, 48, 20, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 9, 43, 36, 3, 3, 2, 8, 1,
        1, 1, 3, 22, 0, 3, 222, 65, 76, 60, 39, 56, 11, 227, 135, 122, 192, 145, 214, 26, 225, 214, 250, 249, 19,
        106]);
      break;
    case AsyAlgName.P160t1:
      dataBlob.data = new Uint8Array([48, 46, 48, 20, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 9, 43, 36, 3, 3, 2, 8, 1,
        1, 2, 3, 22, 0, 3, 106, 2, 224, 41, 186, 250, 88, 232, 34, 199, 115, 69, 55, 253, 228, 207, 183, 197, 214,
        237]);
      break;
    case AsyAlgName.P192r1:
      dataBlob.data = new Uint8Array([48, 50, 48, 20, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 9, 43, 36, 3, 3, 2, 8, 1,
        1, 3, 3, 26, 0, 2, 162, 30, 65, 134, 210, 58, 36, 90, 23, 69, 17, 26, 146, 70, 206, 209, 152, 200, 147, 62,
        28, 12, 225, 141]);
      break;
    case AsyAlgName.P192t1:
      dataBlob.data = new Uint8Array([48, 50, 48, 20, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 9, 43, 36, 3, 3, 2, 8, 1,
        1, 4, 3, 26, 0, 3, 110, 247, 37, 85, 226, 65, 241, 253, 44, 19, 75, 120, 104, 165, 100, 52, 101, 75, 97, 71,
        35, 3, 209, 232]);
      break;
    case AsyAlgName.P224r1:
      dataBlob.data = new Uint8Array([48, 54, 48, 20, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 9, 43, 36, 3, 3, 2, 8, 1,
        1, 5, 3, 30, 0, 3, 197, 24, 81, 202, 178, 82, 27, 142, 110, 185, 52, 221, 190, 212, 23, 155, 109, 53, 234,
        200, 243, 90, 11, 99, 243, 201, 11, 45]);
      break;
    case AsyAlgName.P224t1:
      dataBlob.data = new Uint8Array([48, 54, 48, 20, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 9, 43, 36, 3, 3, 2, 8, 1,
        1, 6, 3, 30, 0, 3, 137, 112, 98, 61, 129, 146, 9, 195, 131, 48, 187, 211, 134, 141, 47, 180, 76, 66, 205, 41,
        79, 3, 220, 85, 155, 10, 119, 42]);
      break;
    case AsyAlgName.P256r1:
      dataBlob.data = new Uint8Array([48, 58, 48, 20, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 9, 43, 36, 3, 3, 2, 8, 1,
        1, 7, 3, 34, 0, 2, 38, 178, 245, 8, 248, 16, 218, 212, 175, 53, 215, 114, 82, 238, 129, 83, 110, 56, 244,
        76, 116, 57, 215, 77, 178, 173, 40, 254, 131, 48, 97, 115]);
      break;
    case AsyAlgName.P256t1:
      dataBlob.data = new Uint8Array([48, 58, 48, 20, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 9, 43, 36, 3, 3, 2, 8, 1,
        1, 8, 3, 34, 0, 3, 168, 56, 80, 38, 69, 7, 58, 201, 153, 145, 238, 181, 99, 97, 170, 225, 211, 183, 82, 187,
        61, 168, 149, 22, 240, 170, 0, 236, 92, 111, 182, 58]);
      break;
    case AsyAlgName.P320r1:
      dataBlob.data = new Uint8Array([48, 66, 48, 20, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 9, 43, 36, 3, 3, 2, 8, 1,
        1, 9, 3, 42, 0, 3, 117, 59, 68, 204, 171, 209, 204, 89, 132, 92, 189, 175, 14, 194, 221, 158, 0, 132, 32,
        211, 65, 164, 141, 171, 236, 208, 142, 216, 80, 111, 192, 117, 155, 72, 71, 249, 100, 236, 178, 107]);
      break;
    case AsyAlgName.P320t1:
      dataBlob.data = new Uint8Array([48, 66, 48, 20, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 9, 43, 36, 3, 3, 2, 8, 1,
        1, 10, 3, 42, 0, 3, 207, 124, 71, 93, 223, 92, 46, 31, 215, 219, 11, 25, 1, 217, 106, 213, 255, 164, 93,
        106, 9, 54, 51, 98, 105, 93, 108, 85, 117, 178, 151, 187, 101, 205, 248, 174, 32, 189, 126, 22]);
      break;
    case AsyAlgName.P384r1:
      dataBlob.data = new Uint8Array([48, 74, 48, 20, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 9, 43, 36, 3, 3, 2, 8, 1,
        1, 11, 3, 50, 0, 3, 27, 120, 128, 63, 12, 62, 201, 32, 216, 65, 223, 145, 138, 12, 233, 0, 116, 40, 198,
        161, 186, 97, 39, 208, 202, 127, 148, 104, 66, 5, 159, 34, 150, 80, 120, 175, 96, 189, 235, 255, 81, 105,
        193, 226, 228, 212, 121, 125]);
      break;
    case AsyAlgName.P384t1:
      dataBlob.data = new Uint8Array([48, 74, 48, 20, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 9, 43, 36, 3, 3, 2, 8, 1,
        1, 12, 3, 50, 0, 3, 134, 242, 112, 136, 140, 141, 198, 196, 245, 128, 47, 162, 144, 149, 118, 71, 75, 75,
        29, 132, 188, 141, 216, 226, 157, 11, 251, 158, 116, 229, 1, 2, 74, 168, 52, 179, 38, 224, 189, 51, 28, 143,
        173, 35, 218, 189, 71, 97]);
      break;
    case AsyAlgName.P512r1:
      dataBlob.data = new Uint8Array([48, 90, 48, 20, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 9, 43, 36, 3, 3, 2, 8, 1,
        1, 13, 3, 66, 0, 2, 159, 16, 127, 64, 114, 31, 198, 219, 213, 135, 46, 115, 171, 87, 216, 64, 137, 114, 135,
        147, 129, 168, 198, 106, 121, 99, 127, 250, 95, 160, 214, 213, 60, 101, 151, 195, 131, 63, 203, 76, 127,
        191, 210, 209, 148, 189, 16, 36, 49, 29, 242, 23, 152, 122, 231, 114, 252, 172, 225, 208, 139, 74, 50, 88]);
      break;
    case AsyAlgName.P512t1:
      dataBlob.data = new Uint8Array([48, 90, 48, 20, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 9, 43, 36, 3, 3, 2, 8, 1,
        1, 14, 3, 66, 0, 2, 45, 76, 185, 227, 119, 98, 211, 74, 122, 83, 1, 24, 62, 188, 65, 169, 19, 50, 211, 155,
        252, 232, 36, 56, 95, 128, 222, 152, 124, 2, 238, 102, 122, 43, 114, 182, 109, 41, 189, 144, 38, 158, 42,
        87, 193, 168, 70, 151, 162, 215, 134, 9, 75, 103, 92, 124, 79, 226, 175, 6, 124, 4, 26, 36]);
      break;
    default:
      dataBlob.data = new Uint8Array([48, 58, 48, 20, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 9, 43, 36, 3, 3, 2, 8, 1,
        1, 7, 3, 34, 0, 2, 38, 178, 245, 8, 248, 16, 218, 212, 175, 53, 215, 114, 82, 238, 129, 83, 110, 56, 244,
        76, 116, 57, 215, 77, 178, 173, 40, 254, 131, 48, 97, 115]);
      break;
  }
  return dataBlob;
}

export function unCompressedKeyBlob(algName: AsyAlgName): cryptoFramework.DataBlob {
  let dataBlob: cryptoFramework.DataBlob = {
    data: new Uint8Array()
  };
  switch (algName) {
    case AsyAlgName.ECC224:
      dataBlob.data = new Uint8Array([48, 78, 48, 16, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 5, 43, 129, 4, 0, 33, 3,
        58, 0, 4, 94, 82, 199, 184, 99, 49, 188, 112, 196, 36, 13, 164, 248, 49, 214, 234, 184, 94, 44, 207, 130,
        65, 234, 133, 136, 235, 175, 25, 206, 40, 36, 68, 14, 229, 78, 68, 240, 108, 172, 194, 60, 235, 200, 155,
        207, 46, 86, 106, 80, 7, 11, 53, 118, 120, 1, 169]);
      break;
    case AsyAlgName.ECC256:
      dataBlob.data = new Uint8Array([48, 89, 48, 19, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 8, 42, 134, 72, 206, 61,
        3, 1, 7, 3, 66, 0, 4, 66, 56, 77, 153, 42, 114, 250, 72, 19, 209, 151, 140, 8, 75, 220, 185, 110, 246, 123,
        189, 100, 3, 67, 166, 61, 139, 104, 226, 31, 209, 74, 26, 224, 33, 158, 208, 146, 48, 54, 84, 59, 5, 178,
        225, 200, 59, 223, 70, 108, 185, 44, 48, 241, 41, 7, 74, 132, 231, 146, 192, 135, 85, 211, 209]);
      break;
    case AsyAlgName.ECC384:
      dataBlob.data = new Uint8Array([48, 118, 48, 16, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 5, 43, 129, 4, 0, 34, 3,
        98, 0, 4, 67, 46, 54, 188, 60, 116, 143, 214, 26, 252, 159, 175, 137, 186, 87, 18, 232, 229, 119, 234, 62,
        59, 194, 134, 252, 7, 205, 122, 90, 231, 139, 228, 11, 125, 25, 205, 136, 60, 141, 201, 166, 26, 101, 47,
        207, 214, 22, 77, 0, 62, 100, 230, 177, 214, 150, 97, 251, 44, 170, 146, 11, 138, 214, 24, 175, 32, 212,
        198, 90, 223, 209, 27, 206, 101, 150, 39, 99, 204, 33, 67, 64, 155, 177, 79, 18, 124, 176, 172, 81, 238,
        37, 112, 46, 13, 232, 244]);
      break;
    case AsyAlgName.ECC521:
      dataBlob.data = new Uint8Array([48, 129, 155, 48, 16, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 5, 43, 129, 4, 0,
        35, 3, 129, 134, 0, 4, 1, 204, 183, 255, 64, 184, 236, 36, 174, 193, 141, 213, 78, 170, 164, 38, 131, 121,
        26, 196, 194, 26, 129, 183, 163, 208, 148, 60, 131, 68, 22, 225, 113, 122, 233, 63, 19, 239, 61, 57, 192,
        97, 225, 95, 19, 36, 37, 194, 64, 128, 71, 28, 204, 140, 243, 167, 137, 194, 169, 122, 97, 79, 173, 146,
        200, 120, 0, 80, 31, 31, 207, 180, 225, 253, 92, 254, 29, 133, 81, 189, 111, 229, 158, 178, 235, 137, 159,
        193, 86, 0, 81, 240, 219, 113, 51, 163, 41, 236, 23, 172, 103, 80, 95, 28, 194, 147, 54, 186, 228, 133, 153,
        138, 137, 241, 88, 105, 69, 194, 35, 244, 102, 84, 9, 58, 110, 247, 27, 93, 234, 225, 96, 253]);
      break;
    case AsyAlgName.P160r1:
      dataBlob.data = new Uint8Array([48, 66, 48, 20, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 9, 43, 36, 3, 3, 2, 8, 1,
        1, 1, 3, 42, 0, 4, 222, 65, 76, 60, 39, 56, 11, 227, 135, 122, 192, 145, 214, 26, 225, 214, 250, 249, 19,
        106, 134, 160, 31, 44, 19, 94, 10, 90, 143, 6, 58, 113, 71, 222, 66, 6, 98, 90, 226, 149]);
      break;
    case AsyAlgName.P160t1:
      dataBlob.data = new Uint8Array([48, 66, 48, 20, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 9, 43, 36, 3, 3, 2, 8, 1,
        1, 2, 3, 42, 0, 4, 106, 2, 224, 41, 186, 250, 88, 232, 34, 199, 115, 69, 55, 253, 228, 207, 183, 197, 214,
        237, 119, 78, 98, 105, 23, 230, 44, 4, 126, 227, 2, 58, 12, 3, 171, 76, 150, 214, 199, 125]);
      break;
    case AsyAlgName.P192r1:
      dataBlob.data = new Uint8Array([48, 74, 48, 20, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 9, 43, 36, 3, 3, 2, 8, 1,
        1, 3, 3, 50, 0, 4, 162, 30, 65, 134, 210, 58, 36, 90, 23, 69, 17, 26, 146, 70, 206, 209, 152, 200, 147, 62,
        28, 12, 225, 141, 179, 36, 3, 10, 101, 252, 125, 196, 108, 121, 130, 215, 232, 170, 141, 206, 125, 139, 154,
        48, 83, 82, 19, 20]);
      break;
    case AsyAlgName.P192t1:
      dataBlob.data = new Uint8Array([48, 74, 48, 20, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 9, 43, 36, 3, 3, 2, 8, 1,
        1, 4, 3, 50, 0, 4, 110, 247, 37, 85, 226, 65, 241, 253, 44, 19, 75, 120, 104, 165, 100, 52, 101, 75, 97, 71,
        35, 3, 209, 232, 65, 73, 42, 157, 61, 13, 55, 40, 175, 239, 237, 234, 198, 129, 96, 253, 103, 70, 193, 150,
        162, 46, 55, 195]);
      break;
    case AsyAlgName.P224r1:
      dataBlob.data = new Uint8Array([48, 82, 48, 20, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 9, 43, 36, 3, 3, 2, 8, 1,
        1, 5, 3, 58, 0, 4, 197, 24, 81, 202, 178, 82, 27, 142, 110, 185, 52, 221, 190, 212, 23, 155, 109, 53, 234,
        200, 243, 90, 11, 99, 243, 201, 11, 45, 41, 241, 153, 141, 226, 121, 253, 58, 46, 118, 192, 199, 141, 86,
        122, 67, 18, 131, 74, 103, 8, 47, 33, 173, 125, 173, 77, 211]);
      break;
    case AsyAlgName.P224t1:
      dataBlob.data = new Uint8Array([48, 82, 48, 20, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 9, 43, 36, 3, 3, 2, 8, 1,
        1, 6, 3, 58, 0, 4, 137, 112, 98, 61, 129, 146, 9, 195, 131, 48, 187, 211, 134, 141, 47, 180, 76, 66, 205,
        41, 79, 3, 220, 85, 155, 10, 119, 42, 178, 110, 37, 168, 185, 199, 221, 190, 143, 179, 215, 255, 21, 120,
        236, 103, 221, 118, 222, 208, 253, 175, 151, 137, 206, 114, 102, 53]);
      break;
    case AsyAlgName.P256r1:
      dataBlob.data = new Uint8Array([48, 90, 48, 20, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 9, 43, 36, 3, 3, 2, 8, 1,
        1, 7, 3, 66, 0, 4, 38, 178, 245, 8, 248, 16, 218, 212, 175, 53, 215, 114, 82, 238, 129, 83, 110, 56, 244,
        76, 116, 57, 215, 77, 178, 173, 40, 254, 131, 48, 97, 115, 31, 135, 4, 79, 164, 37, 154, 68, 163, 230, 6,
        216, 166, 73, 94, 132, 158, 165, 56, 233, 230, 251, 61, 3, 240, 108, 111, 105, 5, 229, 237, 232]);
      break;
    case AsyAlgName.P256t1:
      dataBlob.data = new Uint8Array([48, 90, 48, 20, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 9, 43, 36, 3, 3, 2, 8, 1,
        1, 8, 3, 66, 0, 4, 168, 56, 80, 38, 69, 7, 58, 201, 153, 145, 238, 181, 99, 97, 170, 225, 211, 183, 82, 187,
        61, 168, 149, 22, 240, 170, 0, 236, 92, 111, 182, 58, 57, 187, 101, 175, 23, 175, 131, 143, 166, 32, 86,
        145, 49, 217, 27, 72, 231, 167, 24, 39, 162, 151, 232, 87, 130, 14, 232, 46, 12, 10, 90, 191]);
      break;
    case AsyAlgName.P320r1:
      dataBlob.data = new Uint8Array([48, 106, 48, 20, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 9, 43, 36, 3, 3, 2, 8,
        1, 1, 9, 3, 82, 0, 4, 117, 59, 68, 204, 171, 209, 204, 89, 132, 92, 189, 175, 14, 194, 221, 158, 0, 132,
        32, 211, 65, 164, 141, 171, 236, 208, 142, 216, 80, 111, 192, 117, 155, 72, 71, 249, 100, 236, 178, 107,
        16, 141, 182, 33, 13, 132, 47, 31, 108, 161, 227, 62, 97, 30, 240, 211, 32, 128, 48, 145, 130, 239, 116,
        119, 127, 123, 206, 36, 163, 217, 127, 50, 91, 197, 175, 31, 93, 21, 197, 149]);
      break;
    case AsyAlgName.P320t1:
      dataBlob.data = new Uint8Array([48, 106, 48, 20, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 9, 43, 36, 3, 3, 2, 8,
        1, 1, 10, 3, 82, 0, 4, 207, 124, 71, 93, 223, 92, 46, 31, 215, 219, 11, 25, 1, 217, 106, 213, 255, 164, 93,
        106, 9, 54, 51, 98, 105, 93, 108, 85, 117, 178, 151, 187, 101, 205, 248, 174, 32, 189, 126, 22, 183, 147,
        203, 14, 39, 132, 255, 209, 15, 164, 219, 137, 61, 30, 44, 159, 253, 169, 228, 67, 217, 22, 86, 227, 103,
        47, 2, 90, 36, 21, 12, 160, 181, 76, 115, 39, 64, 31, 239, 173]);
      break;
    case AsyAlgName.P384r1:
      dataBlob.data = new Uint8Array([48, 122, 48, 20, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 9, 43, 36, 3, 3, 2, 8,
        1, 1, 11, 3, 98, 0, 4, 27, 120, 128, 63, 12, 62, 201, 32, 216, 65, 223, 145, 138, 12, 233, 0, 116, 40, 198,
        161, 186, 97, 39, 208, 202, 127, 148, 104, 66, 5, 159, 34, 150, 80, 120, 175, 96, 189, 235, 255, 81, 105,
        193, 226, 228, 212, 121, 125, 107, 181, 125, 32, 223, 166, 183, 44, 130, 238, 17, 231, 111, 52, 183, 177,
        99, 222, 225, 238, 30, 254, 235, 53, 100, 120, 104, 46, 76, 82, 45, 7, 249, 71, 79, 234, 189, 25, 13, 111,
        163, 72, 251, 196, 20, 178, 255, 159]);
      break;
    case AsyAlgName.P384t1:
      dataBlob.data = new Uint8Array([48, 122, 48, 20, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 9, 43, 36, 3, 3, 2, 8,
        1, 1, 12, 3, 98, 0, 4, 134, 242, 112, 136, 140, 141, 198, 196, 245, 128, 47, 162, 144, 149, 118, 71, 75, 75,
        29, 132, 188, 141, 216, 226, 157, 11, 251, 158, 116, 229, 1, 2, 74, 168, 52, 179, 38, 224, 189, 51, 28, 143,
        173, 35, 218, 189, 71, 97, 50, 69, 163, 113, 181, 141, 207, 39, 26, 74, 46, 242, 102, 72, 134, 60, 171, 188,
        133, 180, 36, 214, 124, 174, 172, 29, 102, 250, 213, 196, 235, 244, 162, 26, 183, 21, 233, 142, 175, 231,
        90, 100, 158, 154, 248, 192, 171, 53]);
      break;
    case AsyAlgName.P512r1:
      dataBlob.data = new Uint8Array([48, 129, 155, 48, 20, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 9, 43, 36, 3, 3, 2,
        8, 1, 1, 13, 3, 129, 130, 0, 4, 159, 16, 127, 64, 114, 31, 198, 219, 213, 135, 46, 115, 171, 87, 216, 64,
        137, 114, 135, 147, 129, 168, 198, 106, 121, 99, 127, 250, 95, 160, 214, 213, 60, 101, 151, 195, 131, 63,
        203, 76, 127, 191, 210, 209, 148, 189, 16, 36, 49, 29, 242, 23, 152, 122, 231, 114, 252, 172, 225, 208, 139,
        74, 50, 88, 84, 201, 225, 239, 197, 226, 45, 45, 223, 201, 195, 111, 235, 252, 82, 181, 102, 171, 182, 125,
        147, 174, 236, 252, 37, 52, 121, 62, 74, 86, 192, 162, 150, 252, 251, 239, 244, 130, 98, 8, 221, 79, 136,
        191, 29, 219, 222, 171, 109, 22, 241, 246, 127, 12, 195, 7, 158, 9, 226, 122, 28, 98, 104, 174]);
      break;
    case AsyAlgName.P512t1:
      dataBlob.data = new Uint8Array([48, 129, 155, 48, 20, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 9, 43, 36, 3, 3, 2,
        8, 1, 1, 14, 3, 129, 130, 0, 4, 45, 76, 185, 227, 119, 98, 211, 74, 122, 83, 1, 24, 62, 188, 65, 169, 19,
        50, 211, 155, 252, 232, 36, 56, 95, 128, 222, 152, 124, 2, 238, 102, 122, 43, 114, 182, 109, 41, 189, 144,
        38, 158, 42, 87, 193, 168, 70, 151, 162, 215, 134, 9, 75, 103, 92, 124, 79, 226, 175, 6, 124, 4, 26, 36, 52,
        238, 65, 75, 147, 18, 249, 241, 171, 195, 175, 61, 133, 243, 145, 40, 211, 77, 177, 182, 101, 145, 192, 132,
        11, 215, 153, 34, 150, 118, 45, 26, 161, 104, 73, 164, 221, 240, 116, 128, 205, 4, 59, 190, 60, 215, 1, 64,
        8, 45, 233, 57, 59, 137, 155, 1, 67, 242, 191, 86, 168, 175, 77, 212]);
      break;
    default:
      dataBlob.data = new Uint8Array([48, 90, 48, 20, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 9, 43, 36, 3, 3, 2, 8, 1,
        1, 7, 3, 66, 0, 4, 38, 178, 245, 8, 248, 16, 218, 212, 175, 53, 215, 114, 82, 238, 129, 83, 110, 56, 244,
        76, 116, 57, 215, 77, 178, 173, 40, 254, 131, 48, 97, 115, 31, 135, 4, 79, 164, 37, 154, 68, 163, 230, 6,
        216, 166, 73, 94, 132, 158, 165, 56, 233, 230, 251, 61, 3, 240, 108, 111, 105, 5, 229, 237, 232]);
      break;
  }
  return dataBlob;
}

export function compressedPointData(algName: AsyAlgName): Uint8Array {
  switch (algName) {
    case AsyAlgName.ECC224:
      return new Uint8Array([3, 94, 82, 199, 184, 99, 49, 188, 112, 196, 36, 13, 164, 248, 49, 214, 234, 184, 94,
        44, 207, 130, 65, 234, 133, 136, 235, 175, 25]);
    case AsyAlgName.ECC256:
      return new Uint8Array([3, 66, 56, 77, 153, 42, 114, 250, 72, 19, 209, 151, 140, 8, 75, 220, 185, 110, 246,
        123, 189, 100, 3, 67, 166, 61, 139, 104, 226, 31, 209, 74, 26]);
    case AsyAlgName.ECC384:
      return new Uint8Array([2, 67, 46, 54, 188, 60, 116, 143, 214, 26, 252, 159, 175, 137, 186, 87, 18, 232, 229,
        119, 234, 62, 59, 194, 134, 252, 7, 205, 122, 90, 231, 139, 228, 11, 125, 25, 205, 136, 60, 141, 201, 166,
        26, 101, 47, 207, 214, 22, 77]);
    case AsyAlgName.ECC521:
      return new Uint8Array([3, 1, 204, 183, 255, 64, 184, 236, 36, 174, 193, 141, 213, 78, 170, 164, 38, 131, 121,
        26, 196, 194, 26, 129, 183, 163, 208, 148, 60, 131, 68, 22, 225, 113, 122, 233, 63, 19, 239, 61, 57, 192,
        97, 225, 95, 19, 36, 37, 194, 64, 128, 71, 28, 204, 140, 243, 167, 137, 194, 169, 122, 97, 79, 173, 146,
        200, 120]);
    case AsyAlgName.P160r1:
      return new Uint8Array([3, 222, 65, 76, 60, 39, 56, 11, 227, 135, 122, 192, 145, 214, 26, 225, 214, 250, 249,
        19, 106]);
    case AsyAlgName.P160t1:
      return new Uint8Array([3, 106, 2, 224, 41, 186, 250, 88, 232, 34, 199, 115, 69, 55, 253, 228, 207, 183, 197,
        214, 237]);
    case AsyAlgName.P192r1:
      return new Uint8Array([2, 162, 30, 65, 134, 210, 58, 36, 90, 23, 69, 17, 26, 146, 70, 206, 209, 152, 200, 147,
        62, 28, 12, 225, 141]);
    case AsyAlgName.P192t1:
      return new Uint8Array([3, 110, 247, 37, 85, 226, 65, 241, 253, 44, 19, 75, 120, 104, 165, 100, 52, 101, 75,
        97, 71, 35, 3, 209, 232]);
    case AsyAlgName.P224r1:
      return new Uint8Array([3, 197, 24, 81, 202, 178, 82, 27, 142, 110, 185, 52, 221, 190, 212, 23, 155, 109, 53,
        234, 200, 243, 90, 11, 99, 243, 201, 11, 45]);
    case AsyAlgName.P224t1:
      return new Uint8Array([3, 137, 112, 98, 61, 129, 146, 9, 195, 131, 48, 187, 211, 134, 141, 47, 180, 76, 66,
        205, 41, 79, 3, 220, 85, 155, 10, 119, 42]);
    case AsyAlgName.P256r1:
      return new Uint8Array([2, 38, 178, 245, 8, 248, 16, 218, 212, 175, 53, 215, 114, 82, 238, 129, 83, 110, 56,
        244, 76, 116, 57, 215, 77, 178, 173, 40, 254, 131, 48, 97, 115]);
    case AsyAlgName.P256t1:
      return new Uint8Array([3, 168, 56, 80, 38, 69, 7, 58, 201, 153, 145, 238, 181, 99, 97, 170, 225, 211, 183, 82,
        187, 61, 168, 149, 22, 240, 170, 0, 236, 92, 111, 182, 58]);
    case AsyAlgName.P320r1:
      return new Uint8Array([3, 117, 59, 68, 204, 171, 209, 204, 89, 132, 92, 189, 175, 14, 194, 221, 158, 0, 132,
        32, 211, 65, 164, 141, 171, 236, 208, 142, 216, 80, 111, 192, 117, 155, 72, 71, 249, 100, 236, 178, 107]);
    case AsyAlgName.P320t1:
      return new Uint8Array([3, 207, 124, 71, 93, 223, 92, 46, 31, 215, 219, 11, 25, 1, 217, 106, 213, 255, 164, 93,
        106, 9, 54, 51, 98, 105, 93, 108, 85, 117, 178, 151, 187, 101, 205, 248, 174, 32, 189, 126, 22]);
    case AsyAlgName.P384r1:
      return new Uint8Array([3, 27, 120, 128, 63, 12, 62, 201, 32, 216, 65, 223, 145, 138, 12, 233, 0, 116, 40, 198,
        161, 186, 97, 39, 208, 202, 127, 148, 104, 66, 5, 159, 34, 150, 80, 120, 175, 96, 189, 235, 255, 81, 105,
        193, 226, 228, 212, 121, 125]);
    case AsyAlgName.P384t1:
      return new Uint8Array([3, 134, 242, 112, 136, 140, 141, 198, 196, 245, 128, 47, 162, 144, 149, 118, 71, 75,
        75, 29, 132, 188, 141, 216, 226, 157, 11, 251, 158, 116, 229, 1, 2, 74, 168, 52, 179, 38, 224, 189, 51, 28,
        143, 173, 35, 218, 189, 71, 97]);
    case AsyAlgName.P512r1:
      return new Uint8Array([2, 159, 16, 127, 64, 114, 31, 198, 219, 213, 135, 46, 115, 171, 87, 216, 64, 137, 114,
        135, 147, 129, 168, 198, 106, 121, 99, 127, 250, 95, 160, 214, 213, 60, 101, 151, 195, 131, 63, 203, 76,
        127, 191, 210, 209, 148, 189, 16, 36, 49, 29, 242, 23, 152, 122, 231, 114, 252, 172, 225, 208, 139, 74, 50,
        88]);
    case AsyAlgName.P512t1:
      return new Uint8Array([2, 45, 76, 185, 227, 119, 98, 211, 74, 122, 83, 1, 24, 62, 188, 65, 169, 19, 50, 211,
        155, 252, 232, 36, 56, 95, 128, 222, 152, 124, 2, 238, 102, 122, 43, 114, 182, 109, 41, 189, 144, 38, 158,
        42, 87, 193, 168, 70, 151, 162, 215, 134, 9, 75, 103, 92, 124, 79, 226, 175, 6, 124, 4, 26, 36]);
    case AsyAlgName.SM2:
      return new Uint8Array([3, 103, 243, 184, 80, 189, 192, 186, 93, 58, 41, 216, 160, 136, 60, 75, 23, 97, 42,
        184, 79, 135, 241, 142, 40, 247, 125, 130, 74, 17, 92, 2, 196]);
    default:
      return new Uint8Array([2, 38, 178, 245, 8, 248, 16, 218, 212, 175, 53, 215, 114, 82, 238, 129, 83, 110, 56,
        244, 76, 116, 57, 215, 77, 178, 173, 40, 254, 131, 48, 97, 115]);
  }
}

export function unCompressedPointData(algName: AsyAlgName): Uint8Array {
  switch (algName) {
    case AsyAlgName.ECC224:
      return new Uint8Array([4, 94, 82, 199, 184, 99, 49, 188, 112, 196, 36, 13, 164, 248, 49, 214, 234, 184, 94, 44,
        207, 130, 65, 234, 133, 136, 235, 175, 25, 206, 40, 36, 68, 14, 229, 78, 68, 240, 108, 172, 194, 60, 235,
        200, 155, 207, 46, 86, 106, 80, 7, 11, 53, 118, 120, 1, 169]);
    case AsyAlgName.ECC256:
      return new Uint8Array([4, 66, 56, 77, 153, 42, 114, 250, 72, 19, 209, 151, 140, 8, 75, 220, 185, 110, 246,
        123, 189, 100, 3, 67, 166, 61, 139, 104, 226, 31, 209, 74, 26, 224, 33, 158, 208, 146, 48, 54, 84, 59, 5,
        178, 225, 200, 59, 223, 70, 108, 185, 44, 48, 241, 41, 7, 74, 132, 231, 146, 192, 135, 85, 211, 209]);
    case AsyAlgName.ECC384:
      return new Uint8Array([4, 67, 46, 54, 188, 60, 116, 143, 214, 26, 252, 159, 175, 137, 186, 87, 18, 232, 229,
        119, 234, 62, 59, 194, 134, 252, 7, 205, 122, 90, 231, 139, 228, 11, 125, 25, 205, 136, 60, 141, 201, 166,
        26, 101, 47, 207, 214, 22, 77, 0, 62, 100, 230, 177, 214, 150, 97, 251, 44, 170, 146, 11, 138, 214, 24, 175,
        32, 212, 198, 90, 223, 209, 27, 206, 101, 150, 39, 99, 204, 33, 67, 64, 155, 177, 79, 18, 124, 176, 172, 81,
        238, 37, 112, 46, 13, 232, 244]);
    case AsyAlgName.ECC521:
      return new Uint8Array([4, 1, 204, 183, 255, 64, 184, 236, 36, 174, 193, 141, 213, 78, 170, 164, 38, 131, 121,
        26, 196, 194, 26, 129, 183, 163, 208, 148, 60, 131, 68, 22, 225, 113, 122, 233, 63, 19, 239, 61, 57, 192,
        97, 225, 95, 19, 36, 37, 194, 64, 128, 71, 28, 204, 140, 243, 167, 137, 194, 169, 122, 97, 79, 173, 146,
        200, 120, 0, 80, 31, 31, 207, 180, 225, 253, 92, 254, 29, 133, 81, 189, 111, 229, 158, 178, 235, 137, 159,
        193, 86, 0, 81, 240, 219, 113, 51, 163, 41, 236, 23, 172, 103, 80, 95, 28, 194, 147, 54, 186, 228, 133, 153,
        138, 137, 241, 88, 105, 69, 194, 35, 244, 102, 84, 9, 58, 110, 247, 27, 93, 234, 225, 96, 253]);
    case AsyAlgName.P160r1:
      return new Uint8Array([4, 222, 65, 76, 60, 39, 56, 11, 227, 135, 122, 192, 145, 214, 26, 225, 214, 250, 249,
        19, 106, 134, 160, 31, 44, 19, 94, 10, 90, 143, 6, 58, 113, 71, 222, 66, 6, 98, 90, 226, 149]);
    case AsyAlgName.P160t1:
      return new Uint8Array([4, 106, 2, 224, 41, 186, 250, 88, 232, 34, 199, 115, 69, 55, 253, 228, 207, 183, 197,
        214, 237, 119, 78, 98, 105, 23, 230, 44, 4, 126, 227, 2, 58, 12, 3, 171, 76, 150, 214, 199, 125]);
    case AsyAlgName.P192r1:
      return new Uint8Array([4, 162, 30, 65, 134, 210, 58, 36, 90, 23, 69, 17, 26, 146, 70, 206, 209, 152, 200, 147,
        62, 28, 12, 225, 141, 179, 36, 3, 10, 101, 252, 125, 196, 108, 121, 130, 215, 232, 170, 141, 206, 125, 139,
        154, 48, 83, 82, 19, 20]);
    case AsyAlgName.P192t1:
      return new Uint8Array([4, 110, 247, 37, 85, 226, 65, 241, 253, 44, 19, 75, 120, 104, 165, 100, 52, 101, 75,
        97, 71, 35, 3, 209, 232, 65, 73, 42, 157, 61, 13, 55, 40, 175, 239, 237, 234, 198, 129, 96, 253, 103, 70,
        193, 150, 162, 46, 55, 195]);
    case AsyAlgName.P224r1:
      return new Uint8Array([4, 197, 24, 81, 202, 178, 82, 27, 142, 110, 185, 52, 221, 190, 212, 23, 155, 109, 53,
        234, 200, 243, 90, 11, 99, 243, 201, 11, 45, 41, 241, 153, 141, 226, 121, 253, 58, 46, 118, 192, 199, 141,
        86, 122, 67, 18, 131, 74, 103, 8, 47, 33, 173, 125, 173, 77, 211]);
    case AsyAlgName.P224t1:
      return new Uint8Array([4, 137, 112, 98, 61, 129, 146, 9, 195, 131, 48, 187, 211, 134, 141, 47, 180, 76, 66,
        205, 41, 79, 3, 220, 85, 155, 10, 119, 42, 178, 110, 37, 168, 185, 199, 221, 190, 143, 179, 215, 255, 21,
        120, 236, 103, 221, 118, 222, 208, 253, 175, 151, 137, 206, 114, 102, 53]);
    case AsyAlgName.P256r1:
      return new Uint8Array([4, 38, 178, 245, 8, 248, 16, 218, 212, 175, 53, 215, 114, 82, 238, 129, 83, 110, 56,
        244, 76, 116, 57, 215, 77, 178, 173, 40, 254, 131, 48, 97, 115, 31, 135, 4, 79, 164, 37, 154, 68, 163, 230,
        6, 216, 166, 73, 94, 132, 158, 165, 56, 233, 230, 251, 61, 3, 240, 108, 111, 105, 5, 229, 237, 232]);
    case AsyAlgName.P256t1:
      return new Uint8Array([4, 168, 56, 80, 38, 69, 7, 58, 201, 153, 145, 238, 181, 99, 97, 170, 225, 211, 183, 82,
        187, 61, 168, 149, 22, 240, 170, 0, 236, 92, 111, 182, 58, 57, 187, 101, 175, 23, 175, 131, 143, 166, 32,
        86, 145, 49, 217, 27, 72, 231, 167, 24, 39, 162, 151, 232, 87, 130, 14, 232, 46, 12, 10, 90, 191]);
    case AsyAlgName.P320r1:
      return new Uint8Array([4, 117, 59, 68, 204, 171, 209, 204, 89, 132, 92, 189, 175, 14, 194, 221, 158, 0, 132,
        32, 211, 65, 164, 141, 171, 236, 208, 142, 216, 80, 111, 192, 117, 155, 72, 71, 249, 100, 236, 178, 107, 16,
        141, 182, 33, 13, 132, 47, 31, 108, 161, 227, 62, 97, 30, 240, 211, 32, 128, 48, 145, 130, 239, 116, 119,
        127, 123, 206, 36, 163, 217, 127, 50, 91, 197, 175, 31, 93, 21, 197, 149]);
    case AsyAlgName.P320t1:
      return new Uint8Array([4, 207, 124, 71, 93, 223, 92, 46, 31, 215, 219, 11, 25, 1, 217, 106, 213, 255, 164, 93,
        106, 9, 54, 51, 98, 105, 93, 108, 85, 117, 178, 151, 187, 101, 205, 248, 174, 32, 189, 126, 22, 183, 147,
        203, 14, 39, 132, 255, 209, 15, 164, 219, 137, 61, 30, 44, 159, 253, 169, 228, 67, 217, 22, 86, 227, 103,
        47, 2, 90, 36, 21, 12, 160, 181, 76, 115, 39, 64, 31, 239, 173]);
    case AsyAlgName.P384r1:
      return new Uint8Array([4, 27, 120, 128, 63, 12, 62, 201, 32, 216, 65, 223, 145, 138, 12, 233, 0, 116, 40, 198,
        161, 186, 97, 39, 208, 202, 127, 148, 104, 66, 5, 159, 34, 150, 80, 120, 175, 96, 189, 235, 255, 81, 105,
        193, 226, 228, 212, 121, 125, 107, 181, 125, 32, 223, 166, 183, 44, 130, 238, 17, 231, 111, 52, 183, 177,
        99, 222, 225, 238, 30, 254, 235, 53, 100, 120, 104, 46, 76, 82, 45, 7, 249, 71, 79, 234, 189, 25, 13, 111,
        163, 72, 251, 196, 20, 178, 255, 159]);
    case AsyAlgName.P384t1:
      return new Uint8Array([4, 134, 242, 112, 136, 140, 141, 198, 196, 245, 128, 47, 162, 144, 149, 118, 71, 75,
        75, 29, 132, 188, 141, 216, 226, 157, 11, 251, 158, 116, 229, 1, 2, 74, 168, 52, 179, 38, 224, 189, 51, 28,
        143, 173, 35, 218, 189, 71, 97, 50, 69, 163, 113, 181, 141, 207, 39, 26, 74, 46, 242, 102, 72, 134, 60, 171,
        188, 133, 180, 36, 214, 124, 174, 172, 29, 102, 250, 213, 196, 235, 244, 162, 26, 183, 21, 233, 142, 175,
        231, 90, 100, 158, 154, 248, 192, 171, 53]);
    case AsyAlgName.P512r1:
      return new Uint8Array([4, 159, 16, 127, 64, 114, 31, 198, 219, 213, 135, 46, 115, 171, 87, 216, 64, 137, 114,
        135, 147, 129, 168, 198, 106, 121, 99, 127, 250, 95, 160, 214, 213, 60, 101, 151, 195, 131, 63, 203, 76,
        127, 191, 210, 209, 148, 189, 16, 36, 49, 29, 242, 23, 152, 122, 231, 114, 252, 172, 225, 208, 139, 74, 50,
        88, 84, 201, 225, 239, 197, 226, 45, 45, 223, 201, 195, 111, 235, 252, 82, 181, 102, 171, 182, 125, 147,
        174, 236, 252, 37, 52, 121, 62, 74, 86, 192, 162, 150, 252, 251, 239, 244, 130, 98, 8, 221, 79, 136, 191,
        29, 219, 222, 171, 109, 22, 241, 246, 127, 12, 195, 7, 158, 9, 226, 122, 28, 98, 104, 174]);
    case AsyAlgName.P512t1:
      return new Uint8Array([4, 45, 76, 185, 227, 119, 98, 211, 74, 122, 83, 1, 24, 62, 188, 65, 169, 19, 50, 211,
        155, 252, 232, 36, 56, 95, 128, 222, 152, 124, 2, 238, 102, 122, 43, 114, 182, 109, 41, 189, 144, 38, 158,
        42, 87, 193, 168, 70, 151, 162, 215, 134, 9, 75, 103, 92, 124, 79, 226, 175, 6, 124, 4, 26, 36, 52, 238, 65,
        75, 147, 18, 249, 241, 171, 195, 175, 61, 133, 243, 145, 40, 211, 77, 177, 182, 101, 145, 192, 132, 11, 215,
        153, 34, 150, 118, 45, 26, 161, 104, 73, 164, 221, 240, 116, 128, 205, 4, 59, 190, 60, 215, 1, 64, 8, 45,
        233, 57, 59, 137, 155, 1, 67, 242, 191, 86, 168, 175, 77, 212]);
    case AsyAlgName.SM2:
      return new Uint8Array([4, 103, 243, 184, 80, 189, 192, 186, 93, 58, 41, 216, 160, 136, 60, 75, 23, 97, 42,
        184, 79, 135, 241, 142, 40, 247, 125, 130, 74, 17, 92, 2, 196, 212, 137, 102, 206, 117, 75, 187, 237, 214,
        80, 26, 19, 133, 225, 178, 5, 193, 134, 233, 38, 173, 237, 68, 40, 113, 69, 232, 137, 125, 75, 32, 113]);
    default:
      return new Uint8Array([4, 38, 178, 245, 8, 248, 16, 218, 212, 175, 53, 215, 114, 82, 238, 129, 83, 110, 56,
        244, 76, 116, 57, 215, 77, 178, 173, 40, 254, 131, 48, 97, 115, 31, 135, 4, 79, 164, 37, 154, 68, 163, 230,
        6, 216, 166, 73, 94, 132, 158, 165, 56, 233, 230, 251, 61, 3, 240, 108, 111, 105, 5, 229, 237, 232]);
  }
}

export function pkPoint(algName: AsyAlgName): cpFw.Point {
  switch (algName) {
    case AsyAlgName.ECC224:
      return ecc224Pk();
    case AsyAlgName.ECC256:
      return ecc256Pk();
    case AsyAlgName.ECC384:
      return ecc384Pk();
    case AsyAlgName.ECC521:
      return ecc521Pk();
    case AsyAlgName.P160r1:
      return p160r1Pk();
    case AsyAlgName.P160t1:
      return p160t1Pk();
    case AsyAlgName.P192r1:
      return p192r1Pk();
    case AsyAlgName.P192t1:
      return p192t1Pk();
    case AsyAlgName.P224r1:
      return p224r1Pk();
    case AsyAlgName.P224t1:
      return p224t1Pk();
    case AsyAlgName.P256r1:
      return p256r1Pk();
    case AsyAlgName.P256t1:
      return p256t1Pk();
    case AsyAlgName.P320r1:
      return p320r1Pk();
    case AsyAlgName.P320t1:
      return p320t1Pk();
    case AsyAlgName.P384r1:
      return p384r1Pk();
    case AsyAlgName.P384t1:
      return p384t1Pk();
    case AsyAlgName.P512r1:
      return p512r1Pk();
    case AsyAlgName.P512t1:
      return p512t1Pk();
    case AsyAlgName.SM2:
      return SM2Pk()
    default:
      return p256r1Pk();
  }
}

