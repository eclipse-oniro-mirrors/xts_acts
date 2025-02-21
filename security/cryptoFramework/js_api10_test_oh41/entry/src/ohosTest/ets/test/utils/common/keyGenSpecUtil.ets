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
}

export function SM2CommonSpec(): cpFw.ECCCommonParamsSpec {
  let fieldFp: cpFw.ECFieldFp = {
    fieldType: "Fp",
    p: BigInt("0xfffffffeffffffffffffffffffffffffffffffff00000000ffffffffffffffff"),
  };

  let G: cpFw.Point = {
    x: BigInt("0x32C4AE2C1F1981195F9904466A39C9948FE30BBFF2660BE1715A4589334C74C7"),
    y: BigInt("0xBC3736A2F4F6779C59BDCEE36B692153D0A9877CC62A474002DF32E52139F0A0"),
  };

  let sm2CommonSpec: cpFw.ECCCommonParamsSpec = {
    algName: "SM2",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    field: fieldFp,
    a: BigInt("0xFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FFFFFFFFFFFFFFFC"),
    b: BigInt("0x28E9FA9E9D9F5E344D5A9E4BCF6509A7F39789F515AB8F92DDBCBD414D940E93"),
    g: G,
    n: BigInt("0xFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFF7203DF6B21C6052B53BBF40939D54123"),
    h: 1,
  };
  return sm2CommonSpec;
}

export function SM2Sk() {
  return BigInt('0x6330B599ECD23ABDC74B9A5B7B5E00E553005F72743101C5FAB83AEB579B7074');
}

export function SM2Pk() {
  let pk: cpFw.Point = {
    x: BigInt('0x67F3B850BDC0BA5D3A29D8A0883C4B17612AB84F87F18E28F77D824A115C02C4'),
    y: BigInt('0xD48966CE754BBBEDD6501A1385E1B205C186E926ADED44287145E8897D4B2071')
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
}

export function ecc224Spec(): cpFw.ECCCommonParamsSpec {
  let fieldFp: cpFw.ECFieldFp = {
    fieldType: "Fp",
    p: BigInt("0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000001"),
  };

  let G: cpFw.Point = {
    x: BigInt("0xB70E0CBD6BB4BF7F321390B94A03C1D356C21122343280D6115C1D21"),
    y: BigInt("0xBD376388B5F723FB4C22DFE6CD4375A05A07476444D5819985007E34"),
  };

  let ecc224CommonSpec: cpFw.ECCCommonParamsSpec = {
    algName: "EC",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    field: fieldFp,
    a: BigInt("0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFE"),
    b: BigInt("0xB4050A850C04B3ABF54132565044B0B7D7BFD8BA270B39432355FFB4"),
    g: G,
    n: BigInt("0xFFFFFFFFFFFFFFFFFFFFFFFFFFFF16A2E0B8F03E13DD29455C5C2A3D"),
    h: 1,
  };
  return ecc224CommonSpec;
}

export function ecc224Sk(): bigint {
  return BigInt('0x6CA419D87C380EA7A939236FF604B29F0DA88E60F1BFC17822480E27');
}

export function ecc224Pk(): cpFw.Point {
  let pk: cpFw.Point = {
    x: BigInt('0x5E52C7B86331BC70C4240DA4F831D6EAB85E2CCF8241EA8588EBAF19'),
    y: BigInt('0xCE2824440EE54E44F06CACC23CEBC89BCF2E566A50070B35767801A9')
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
}

export function ecc256Spec(): cpFw.ECCCommonParamsSpec {
  let fieldFp: cpFw.ECFieldFp = {
    fieldType: "Fp",
    p: BigInt("0xFFFFFFFF00000001000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF"),
  };

  let G: cpFw.Point = {
    x: BigInt("0x6B17D1F2E12C4247F8BCE6E563A440F277037D812DEB33A0F4A13945D898C296"),
    y: BigInt("0x4FE342E2FE1A7F9B8EE7EB4A7C0F9E162BCE33576B315ECECBB6406837BF51F5"),
  };

  let ecc256CommonSpec: cpFw.ECCCommonParamsSpec = {
    algName: "EC",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    field: fieldFp,
    a: BigInt("0xFFFFFFFF00000001000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFC"),
    b: BigInt("0x5AC635D8AA3A93E7B3EBBD55769886BC651D06B0CC53B0F63BCE3C3E27D2604B"),
    g: G,
    n: BigInt("0xFFFFFFFF00000000FFFFFFFFFFFFFFFFBCE6FAADA7179E84F3B9CAC2FC632551"),
    h: 1,
  };
  return ecc256CommonSpec;
}

export function ecc256Sk(): bigint {
  return BigInt('0xF68FF57500C0DE2BC84570E0AEC12E545AD1877A03BDA944551A711270801CC');
}

export function ecc256Pk(): cpFw.Point {
  let pk: cpFw.Point = {
    x: BigInt('0x42384D992A72FA4813D1978C084BDCB96EF67BBD640343A63D8B68E21FD14A1A'),
    y: BigInt('0xE0219ED0923036543B05B2E1C83BDF466CB92C30F129074A84E792C08755D3D1')
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
}

export function ecc384Spec(): cpFw.ECCCommonParamsSpec {
  let fieldFp: cpFw.ECFieldFp = {
    fieldType: "Fp",
    p: BigInt("0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFF0000000000000000FFFFFFFF"),
  };

  let G: cpFw.Point = {
    x: BigInt("0xAA87CA22BE8B05378EB1C71EF320AD746E1D3B628BA79B9859F741E082542A385502F25DBF55296C3A545E3872760AB7"),
    y: BigInt("0x3617DE4A96262C6F5D9E98BF9292DC29F8F41DBD289A147CE9DA3113B5F0B8C00A60B1CE1D7E819D7A431D7C90EA0E5F"),
  };

  let ecc384CommonSpec: cpFw.ECCCommonParamsSpec = {
    algName: "EC",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    field: fieldFp,
    a: BigInt("0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFF0000000000000000FFFFFFFC"),
    b: BigInt("0xB3312FA7E23EE7E4988E056BE3F82D19181D9C6EFE8141120314088F5013875AC656398D8A2ED19D2A85C8EDD3EC2AEF"),
    g: G,
    n: BigInt("0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7634D81F4372DDF581A0DB248B0A77AECEC196ACCC52973"),
    h: 1,
  };
  return ecc384CommonSpec;
}

export function ecc384Sk(): bigint {
  return BigInt('0x92BDBA29DFC11051F9F5BB50CEDA69EF4063D294E938B0F416D52F8E98145130BE4F2E60BE760A6E55FF78FBB053A420');
}

export function ecc384Pk(): cpFw.Point {
  let pk: cpFw.Point = {
    x: BigInt('0x432E36BC3C748FD61AFC9FAF89BA5712E8E577EA3E3BC286FC07CD7A5AE78BE40B7D19CD883C8DC9A61A652FCFD6164D'),
    y: BigInt('0x3E64E6B1D69661FB2CAA920B8AD618AF20D4C65ADFD11BCE65962763CC2143409BB14F127CB0AC51EE25702E0DE8F4')
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
}

export function ecc521Spec(): cpFw.ECCCommonParamsSpec {
  let fieldFp: cpFw.ECFieldFp = {
    fieldType: "Fp",
    p: BigInt("0x1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF" +
      "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF"),
  };

  let G: cpFw.Point = {
    x: BigInt("0xC6858E06B70404E9CD9E3ECB662395B4429C648139053FB521F828AF606B4D3DBAA14B5E77EFE75928FE1DC127A2FFA8DE3" +
      "348B3C1856A429BF97E7E31C2E5BD66"),
    y: BigInt("0x11839296A789A3BC0045C8A5FB42C7D1BD998F54449579B446817AFBD17273E662C97EE72995EF42640C550B9013FAD0761" +
      "353C7086A272C24088BE94769FD16650"),
  };

  let ecc521CommonSpec: cpFw.ECCCommonParamsSpec = {
    algName: "EC",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    field: fieldFp,
    a: BigInt("0x1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF" +
      "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC"),
    b: BigInt("0x51953EB9618E1C9A1F929A21A0B68540EEA2DA725B99B315F3B8B489918EF109E156193951EC7E937B1652C0BD3BB1BF073573DF883D2C34F1EF451FD46B503F00"),
    g: G,
    n: BigInt("0x1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA51868783BF2F966B7FCC0148F709A5D0" +
      "3BB5C9B8899C47AEBB6FB71E91386409"),
    h: 1,
  };
  return ecc521CommonSpec;
}

export function ecc521Sk(): bigint {
  return BigInt('0xF727EF1846783243371A5ED5D936CFE38B15A2D1ED90880CDA36C0C7A3F4F0CE57B2A6910FC4C21914438E493332A35FE' +
    'A50773F72ADAA626EB693454134B39C84');
}

export function ecc521Pk(): cpFw.Point {
  let pk: cpFw.Point = {
    x: BigInt('0x1CCB7FF40B8EC24AEC18DD54EAAA42683791AC4C21A81B7A3D0943C834416E1717AE93F13EF3D39C061E15F132425C24080' +
      '471CCC8CF3A789C2A97A614FAD92C878'),
    y: BigInt('0x501F1FCFB4E1FD5CFE1D8551BD6FE59EB2EB899FC1560051F0DB7133A329EC17AC67505F1CC29336BAE485998A89F158694' +
      '5C223F46654093A6EF71B5DEAE160FD')
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
}

export function p160r1Spec(): cpFw.ECCCommonParamsSpec {
  let fieldFp: cpFw.ECFieldFp = {
    fieldType: "Fp",
    p: BigInt("0xE95E4A5F737059DC60DFC7AD95B3D8139515620F"),
  };

  let G: cpFw.Point = {
    x: BigInt("0xBED5AF16EA3F6A4F62938C4631EB5AF7BDBCDBC3"),
    y: BigInt("0x1667CB477A1A8EC338F94741669C976316DA6321"),
  };

  let p160rCommonSpec: cpFw.ECCCommonParamsSpec = {
    algName: "ECC",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    field: fieldFp,
    a: BigInt("0x340E7BE2A280EB74E2BE61BADA745D97E8F7C300"),
    b: BigInt("0x1E589A8595423412134FAA2DBDEC95C8D8675E58"),
    g: G,
    n: BigInt("0xE95E4A5F737059DC60DF5991D45029409E60FC09"),
    h: 1,
  };
  return p160rCommonSpec;
}

export function p160r1Sk(): bigint {
  return BigInt('0x2F42EF58CEA26A04488EA7154B4940FE8779D475');
}

export function p160r1Pk(): cpFw.Point {
  let pk: cpFw.Point = {
    x: BigInt('0xDE414C3C27380BE3877AC091D61AE1D6FAF9136A'),
    y: BigInt('0x86A01F2C135E0A5A8F063A7147DE4206625AE295')
  }
  return pk;
}

export function genP160t1KeySpec(keyType: cpFw.AsyKeySpecType) {
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
}

export function p160t1Spec(): cpFw.ECCCommonParamsSpec {
  let fieldFp: cpFw.ECFieldFp = {
    fieldType: "Fp",
    p: BigInt("0xE95E4A5F737059DC60DFC7AD95B3D8139515620F"),
  };

  let G: cpFw.Point = {
    x: BigInt("0xB199B13B9B34EFC1397E64BAEB05ACC265FF2378"),
    y: BigInt("0xADD6718B7C7C1961F0991B842443772152C9E0AD"),
  };

  let p160tCommonSpec: cpFw.ECCCommonParamsSpec = {
    algName: "ECC",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    field: fieldFp,
    a: BigInt("0xE95E4A5F737059DC60DFC7AD95B3D8139515620C"),
    b: BigInt("0x7A556B6DAE535B7B51ED2C4D7DAA7A0B5C55F380"),
    g: G,
    n: BigInt("0xE95E4A5F737059DC60DF5991D45029409E60FC09"),
    h: 1,
  };
  return p160tCommonSpec;
}

export function p160t1Sk() {
  return BigInt('0x925BD2FA6B1F0067F191A48E63AF45ED5C2D515D');
}

export function p160t1Pk() {
  let pk: cpFw.Point = {
    x: BigInt('0x6A02E029BAFA58E822C7734537FDE4CFB7C5D6ED'),
    y: BigInt('0x774E626917E62C047EE3023A0C03AB4C96D6C77D')
  }
  return pk;
}

export function genP192r1KeySpec(keyType: cpFw.AsyKeySpecType) {
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
}

export function p192r1Spec(): cpFw.ECCCommonParamsSpec {
  let fieldFp: cpFw.ECFieldFp = {
    fieldType: "Fp",
    p: BigInt("0xC302F41D932A36CDA7A3463093D18DB78FCE476DE1A86297"),
  };

  let G: cpFw.Point = {
    x: BigInt("0xC0A0647EAAB6A48753B033C56CB0F0900A2F5C4853375FD6"),
    y: BigInt("0x14B690866ABD5BB88B5F4828C1490002E6773FA2FA299B8F"),
  };

  let p192rCommonSpec: cpFw.ECCCommonParamsSpec = {
    algName: "ECC",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    field: fieldFp,
    a: BigInt("0x6A91174076B1E0E19C39C031FE8685C1CAE040E5C69A28EF"),
    b: BigInt("0x469A28EF7C28CCA3DC721D044F4496BCCA7EF4146FBF25C9"),
    g: G,
    n: BigInt("0xC302F41D932A36CDA7A3462F9E9E916B5BE8F1029AC4ACC1"),
    h: 1,
  };
  return p192rCommonSpec;
}

export function p192r1Sk() {
  return BigInt('0x706A736F09839C321436EAFC5EDAB8109611A9FB8AFFFF65');
}

export function p192r1Pk() {
  let pk: cpFw.Point = {
    x: BigInt('0xA21E4186D23A245A1745111A9246CED198C8933E1C0CE18D'),
    y: BigInt('0xB324030A65FC7DC46C7982D7E8AA8DCE7D8B9A3053521314')
  }
  return pk;
}

export function genP192t1KeySpec(keyType: cpFw.AsyKeySpecType) {
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
}

export function p192t1Spec(): cpFw.ECCCommonParamsSpec {
  let fieldFp: cpFw.ECFieldFp = {
    fieldType: "Fp",
    p: BigInt("0xC302F41D932A36CDA7A3463093D18DB78FCE476DE1A86297"),
  };

  let G: cpFw.Point = {
    x: BigInt("0x3AE9E58C82F63C30282E1FE7BBF43FA72C446AF6F4618129"),
    y: BigInt("0x97E2C5667C2223A902AB5CA449D0084B7E5B3DE7CCC01C9"),
  };

  let p192tCommonSpec: cpFw.ECCCommonParamsSpec = {
    algName: "ECC",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    field: fieldFp,
    a: BigInt("0xC302F41D932A36CDA7A3463093D18DB78FCE476DE1A86294"),
    b: BigInt("0x13D56FFAEC78681E68F9DEB43B35BEC2FB68542E27897B79"),
    g: G,
    n: BigInt("0xC302F41D932A36CDA7A3462F9E9E916B5BE8F1029AC4ACC1"),
    h: 1,
  };
  return p192tCommonSpec;
}

export function p192t1Sk() {
  return BigInt('0x78F6022C070A1A9C824385CC5614067A325A0200042B3A0C');
}

export function p192t1Pk() {
  let pk: cpFw.Point = {
    x: BigInt('0x6EF72555E241F1FD2C134B7868A56434654B61472303D1E8'),
    y: BigInt('0x41492A9D3D0D3728AFEFEDEAC68160FD6746C196A22E37C3')
  }
  return pk;
}

export function genP224r1KeySpec(keyType: cpFw.AsyKeySpecType) {
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
}

export function p224r1Spec(): cpFw.ECCCommonParamsSpec {
  let fieldFp: cpFw.ECFieldFp = {
    fieldType: "Fp",
    p: BigInt("0xD7C134AA264366862A18302575D1D787B09F075797DA89F57EC8C0FF"),
  };

  let G: cpFw.Point = {
    x: BigInt("0xD9029AD2C7E5CF4340823B2A87DC68C9E4CE3174C1E6EFDEE12C07D"),
    y: BigInt("0x58AA56F772C0726F24C6B89E4ECDAC24354B9E99CAA3F6D3761402CD"),
  };

  let p224rCommonSpec: cpFw.ECCCommonParamsSpec = {
    algName: "ECC",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    field: fieldFp,
    a: BigInt("0x68A5E62CA9CE6C1C299803A6C1530B514E182AD8B0042A59CAD29F43"),
    b: BigInt("0x2580F63CCFE44138870713B1A92369E33E2135D266DBB372386C400B"),
    g: G,
    n: BigInt("0xD7C134AA264366862A18302575D0FB98D116BC4B6DDEBCA3A5A7939F"),
    h: 1,
  };
  return p224rCommonSpec;
}

export function p224r1Sk() {
  return BigInt('0x242570C3A99B1B8EC50049A3216A1A254C2FF0A9059780AA735F66C8');
}

export function p224r1Pk() {
  let pk: cpFw.Point = {
    x: BigInt('0xC51851CAB2521B8E6EB934DDBED4179B6D35EAC8F35A0B63F3C90B2D'),
    y: BigInt('0x29F1998DE279FD3A2E76C0C78D567A4312834A67082F21AD7DAD4DD3')
  }
  return pk;
}

export function genP224t1KeySpec(keyType: cpFw.AsyKeySpecType) {
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
}

export function p224t1Spec(): cpFw.ECCCommonParamsSpec {
  let fieldFp: cpFw.ECFieldFp = {
    fieldType: "Fp",
    p: BigInt("0xD7C134AA264366862A18302575D1D787B09F075797DA89F57EC8C0FF"),
  };

  let G: cpFw.Point = {
    x: BigInt("0x6AB1E344CE25FF3896424E7FFE14762ECB49F8928AC0C76029B4D580"),
    y: BigInt("0x374E9F5143E568CD23F3F4D7C0D4B1E41C8CC0D1C6ABD5F1A46DB4C"),
  };

  let p224tCommonSpec: cpFw.ECCCommonParamsSpec = {
    algName: "ECC",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    field: fieldFp,
    a: BigInt("0xD7C134AA264366862A18302575D1D787B09F075797DA89F57EC8C0FC"),
    b: BigInt("0x4B337D934104CD7BEF271BF60CED1ED20DA14C08B3BB64F18A60888D"),
    g: G,
    n: BigInt("0xD7C134AA264366862A18302575D0FB98D116BC4B6DDEBCA3A5A7939F"),
    h: 1,
  };
  return p224tCommonSpec;
}

export function p224t1Sk() {
  return BigInt('0xC478D61D983AB1B24EDEB33588BC322D9CA5F6EDA78AE03DDB30BE5C');
}

export function p224t1Pk() {
  let pk: cpFw.Point = {
    x: BigInt('0x8970623D819209C38330BBD3868D2FB44C42CD294F03DC559B0A772A'),
    y: BigInt('0xB26E25A8B9C7DDBE8FB3D7FF1578EC67DD76DED0FDAF9789CE726635')
  }
  return pk;
}

export function genP256r1KeySpec(keyType: cpFw.AsyKeySpecType) {
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
}

export function p256r1Spec(): cpFw.ECCCommonParamsSpec {
  let fieldFp: cpFw.ECFieldFp = {
    fieldType: "Fp",
    p: BigInt("0xA9FB57DBA1EEA9BC3E660A909D838D726E3BF623D52620282013481D1F6E5377"),
  };

  let G: cpFw.Point = {
    x: BigInt("0x8BD2AEB9CB7E57CB2C4B482FFC81B7AFB9DE27E1E3BD23C23A4453BD9ACE3262"),
    y: BigInt("0x547EF835C3DAC4FD97F8461A14611DC9C27745132DED8E545C1D54C72F046997"),
  };

  let p256rCommonSpec: cpFw.ECCCommonParamsSpec = {
    algName: "ECC",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    field: fieldFp,
    a: BigInt("0x7D5A0975FC2C3057EEF67530417AFFE7FB8055C126DC5C6CE94A4B44F330B5D9"),
    b: BigInt("0x26DC5C6CE94A4B44F330B5D9BBD77CBF958416295CF7E1CE6BCCDC18FF8C07B6"),
    g: G,
    n: BigInt("0xA9FB57DBA1EEA9BC3E660A909D838D718C397AA3B561A6F7901E0E82974856A7"),
    h: 1,
  };
  return p256rCommonSpec;
}

export function p256r1Sk() {
  return BigInt('0x327D0E7BEC81EAE32D8D9207B44A759E5334B57EF7DC0576ABEDB22DF0BA7B82');
}

export function p256r1Pk() {
  let pk: cpFw.Point = {
    x: BigInt('0x26B2F508F810DAD4AF35D77252EE81536E38F44C7439D74DB2AD28FE83306173'),
    y: BigInt('0x1F87044FA4259A44A3E606D8A6495E849EA538E9E6FB3D03F06C6F6905E5EDE8')
  }
  return pk;
}

export function genP256t1KeySpec(keyType: cpFw.AsyKeySpecType) {
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
}

export function p256t1Spec(): cpFw.ECCCommonParamsSpec {
  let fieldFp: cpFw.ECFieldFp = {
    fieldType: "Fp",
    p: BigInt("0xA9FB57DBA1EEA9BC3E660A909D838D726E3BF623D52620282013481D1F6E5377"),
  };

  let G: cpFw.Point = {
    x: BigInt("0xA3E8EB3CC1CFE7B7732213B23A656149AFA142C47AAFBC2B79A191562E1305F4"),
    y: BigInt("0x2D996C823439C56D7F7B22E14644417E69BCB6DE39D027001DABE8F35B25C9BE"),
  };

  let p256tCommonSpec: cpFw.ECCCommonParamsSpec = {
    algName: "ECC",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    field: fieldFp,
    a: BigInt("0xA9FB57DBA1EEA9BC3E660A909D838D726E3BF623D52620282013481D1F6E5374"),
    b: BigInt("0x662C61C430D84EA4FE66A7733D0B76B7BF93EBC4AF2F49256AE58101FEE92B04"),
    g: G,
    n: BigInt("0xA9FB57DBA1EEA9BC3E660A909D838D718C397AA3B561A6F7901E0E82974856A7"),
    h: 1,
  };
  return p256tCommonSpec;
}

export function p256t1Sk() {
  return BigInt('0x412F0687E9634D5FBF82D7BC6A7E61913F0444AEBCF7B1F3A2A8AFDA16E2E794');
}

export function p256t1Pk() {
  let pk: cpFw.Point = {
    x: BigInt('0xA838502645073AC99991EEB56361AAE1D3B752BB3DA89516F0AA00EC5C6FB63A'),
    y: BigInt('0x39BB65AF17AF838FA620569131D91B48E7A71827A297E857820EE82E0C0A5ABF')
  }
  return pk;
}

export function genP320r1KeySpec(keyType: cpFw.AsyKeySpecType) {
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
}

export function p320r1Spec(): cpFw.ECCCommonParamsSpec {
  let fieldFp: cpFw.ECFieldFp = {
    fieldType: "Fp",
    p: BigInt("0xD35E472036BC4FB7E13C785ED201E065F98FCFA6F6F40DEF4F92B9EC7893EC28FCD412B1F1B32E27"),
  };

  let G: cpFw.Point = {
    x: BigInt("0x43BD7E9AFB53D8B85289BCC48EE5BFE6F20137D10A087EB6E7871E2A10A599C710AF8D0D39E20611"),
    y: BigInt("0x14FDD05545EC1CC8AB4093247F77275E0743FFED117182EAA9C77877AAAC6AC7D35245D1692E8EE1"),
  };

  let p320rCommonSpec: cpFw.ECCCommonParamsSpec = {
    algName: "ECC",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    field: fieldFp,
    a: BigInt("0x3EE30B568FBAB0F883CCEBD46D3F3BB8A2A73513F5EB79DA66190EB085FFA9F492F375A97D860EB4"),
    b: BigInt("0x520883949DFDBC42D3AD198640688A6FE13F41349554B49ACC31DCCD884539816F5EB4AC8FB1F1A6"),
    g: G,
    n: BigInt("0xD35E472036BC4FB7E13C785ED201E065F98FCFA5B68F12A32D482EC7EE8658E98691555B44C59311"),
    h: 1,
  };
  return p320rCommonSpec;
}

export function p320r1Sk() {
  return BigInt('0x26DFB6E9516C15913A48685F191C341520BA56411E1F947FF1FFA1033F1E3176480005FC89187A71');
}

export function p320r1Pk() {
  let pk: cpFw.Point = {
    x: BigInt('0x753B44CCABD1CC59845CBDAF0EC2DD9E008420D341A48DABECD08ED8506FC0759B4847F964ECB26B'),
    y: BigInt('0x108DB6210D842F1F6CA1E33E611EF0D32080309182EF74777F7BCE24A3D97F325BC5AF1F5D15C595')
  }
  return pk;
}

export function genP320t1KeySpec(keyType: cpFw.AsyKeySpecType) {
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
}

export function p320t1Spec(): cpFw.ECCCommonParamsSpec {
  let fieldFp: cpFw.ECFieldFp = {
    fieldType: "Fp",
    p: BigInt("0xD35E472036BC4FB7E13C785ED201E065F98FCFA6F6F40DEF4F92B9EC7893EC28FCD412B1F1B32E27"),
  };

  let G: cpFw.Point = {
    x: BigInt("0x925BE9FB01AFC6FB4D3E7D4990010F813408AB106C4F09CB7EE07868CC136FFF3357F624A21BED52"),
    y: BigInt("0x63BA3A7A27483EBF6671DBEF7ABB30EBEE084E58A0B077AD42A5A0989D1EE71B1B9BC0455FB0D2C3"),
  };

  let p320tCommonSpec: cpFw.ECCCommonParamsSpec = {
    algName: "ECC",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    field: fieldFp,
    a: BigInt("0xD35E472036BC4FB7E13C785ED201E065F98FCFA6F6F40DEF4F92B9EC7893EC28FCD412B1F1B32E24"),
    b: BigInt("0xA7F561E038EB1ED560B3D147DB782013064C19F27ED27C6780AAF77FB8A547CEB5B4FEF422340353"),
    g: G,
    n: BigInt("0xD35E472036BC4FB7E13C785ED201E065F98FCFA5B68F12A32D482EC7EE8658E98691555B44C59311"),
    h: 1,
  };
  return p320tCommonSpec;
}

export function p320t1Sk() {
  return BigInt('0x9A887A14345A7514E36A9C39401674A7CBA57FA100966D2ACD783CADF1D15857F58A322D9DF4F120');
}

export function p320t1Pk() {
  let pk: cpFw.Point = {
    x: BigInt('0xCF7C475DDF5C2E1FD7DB0B1901D96AD5FFA45D6A09363362695D6C5575B297BB65CDF8AE20BD7E16'),
    y: BigInt('0xB793CB0E2784FFD10FA4DB893D1E2C9FFDA9E443D91656E3672F025A24150CA0B54C7327401FEFAD')
  }
  return pk;
}

export function genP384r1KeySpec(keyType: cpFw.AsyKeySpecType) {
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
}

export function p384r1Spec(): cpFw.ECCCommonParamsSpec {
  let fieldFp: cpFw.ECFieldFp = {
    fieldType: "Fp",
    p: BigInt("0x8CB91E82A3386D280F5D6F7E50E641DF152F7109ED5456B412B1DA197FB71123ACD3A729901D1A71874700133107EC53"),
  };

  let G: cpFw.Point = {
    x: BigInt("0x1D1C64F068CF45FFA2A63A81B7C13F6B8847A3E77EF14FE3DB7FCAFE0CBD10E8E826E03436D646AAEF87B2E247D4AF1E"),
    y: BigInt("0x8ABE1D7520F9C2A45CB1EB8E95CFD55262B70B29FEEC5864E19C054FF99129280E4646217791811142820341263C5315"),
  };

  let p384rCommonSpec: cpFw.ECCCommonParamsSpec = {
    algName: "ECC",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    field: fieldFp,
    a: BigInt("0x7BC382C63D8C150C3C72080ACE05AFA0C2BEA28E4FB22787139165EFBA91F90F8AA5814A503AD4EB04A8C7DD22CE2826"),
    b: BigInt("0x4A8C7DD22CE28268B39B55416F0447C2FB77DE107DCD2A62E880EA53EEB62D57CB4390295DBC9943AB78696FA504C11"),
    g: G,
    n: BigInt("0x8CB91E82A3386D280F5D6F7E50E641DF152F7109ED5456B31F166E6CAC0425A7CF3AB6AF6B7FC3103B883202E9046565"),
    h: 1,
  };
  return p384rCommonSpec;
}

export function p384r1Sk() {
  return BigInt('0x7203B809A9427A646671FA29B1C953EC1A0EA0A65C90D9D4E639931377B5CAA3D991539328211203ED13F58DDBF2BBDB');
}

export function p384r1Pk() {
  let pk: cpFw.Point = {
    x: BigInt('0x1B78803F0C3EC920D841DF918A0CE9007428C6A1BA6127D0CA7F946842059F22965078AF60BDEBFF5169C1E2E4D4797D'),
    y: BigInt('0x6BB57D20DFA6B72C82EE11E76F34B7B163DEE1EE1EFEEB356478682E4C522D07F9474FEABD190D6FA348FBC414B2FF9F')
  }
  return pk;
}

export function genP384t1KeySpec(keyType: cpFw.AsyKeySpecType) {
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
}

export function p384t1Spec(): cpFw.ECCCommonParamsSpec {
  let fieldFp: cpFw.ECFieldFp = {
    fieldType: "Fp",
    p: BigInt("0x8CB91E82A3386D280F5D6F7E50E641DF152F7109ED5456B412B1DA197FB71123ACD3A729901D1A71874700133107EC53"),
  };

  let G: cpFw.Point = {
    x: BigInt("0x18DE98B02DB9A306F2AFCD7235F72A819B80AB12EBD653172476FECD462AABFFC4FF191B946A5F54D8D0AA2F418808CC"),
    y: BigInt("0x25AB056962D30651A114AFD2755AD336747F93475B7A1FCA3B88F2B6A208CCFE469408584DC2B2912675BF5B9E582928"),
  };

  let p384tCommonSpec: cpFw.ECCCommonParamsSpec = {
    algName: "ECC",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    field: fieldFp,
    a: BigInt("0x8CB91E82A3386D280F5D6F7E50E641DF152F7109ED5456B412B1DA197FB71123ACD3A729901D1A71874700133107EC50"),
    b: BigInt("0x7F519EADA7BDA81BD826DBA647910F8C4B9346ED8CCDC64E4B1ABD11756DCE1D2074AA263B88805CED70355A33B471EE"),
    g: G,
    n: BigInt("0x8CB91E82A3386D280F5D6F7E50E641DF152F7109ED5456B31F166E6CAC0425A7CF3AB6AF6B7FC3103B883202E9046565"),
    h: 1,
  };
  return p384tCommonSpec;
}

export function p384t1Sk() {
  return BigInt('0x1FF73742BD596F00CD3FA2EF9D5D3182E7BBCABB1B753250BDB6527F933AB333F89D51433FE6919EAD09D9993062D9DF');
}

export function p384t1Pk() {
  let pk: cpFw.Point = {
    x: BigInt('0x86F270888C8DC6C4F5802FA2909576474B4B1D84BC8DD8E29D0BFB9E74E501024AA834B326E0BD331C8FAD23DABD4761'),
    y: BigInt('0x3245A371B58DCF271A4A2EF26648863CABBC85B424D67CAEAC1D66FAD5C4EBF4A21AB715E98EAFE75A649E9AF8C0AB35')
  }
  return pk;
}

export function genP512r1KeySpec(keyType: cpFw.AsyKeySpecType) {
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
}

export function p512r1Spec(): cpFw.ECCCommonParamsSpec {
  let fieldFp: cpFw.ECFieldFp = {
    fieldType: "Fp",
    p: BigInt("0xAADD9DB8DBE9C48B3FD4E6AE33C9FC07CB308DB3B3C9D20ED6639CCA703308717D4D9B009BC66842AECDA12AE6A380E6288" +
      "1FF2F2D82C68528AA6056583A48F3"),
  };

  let G: cpFw.Point = {
    x: BigInt("0x81AEE4BDD82ED9645A21322E9C4C6A9385ED9F70B5D916C1B43B62EEF4D0098EFF3B1F78E2D0D48D50D1687B93B97D5F7C6" +
      "D5047406A5E688B352209BCB9F822"),
    y: BigInt("0x7DDE385D566332ECC0EABFA9CF7822FDF209F70024A57B1AA000C55B881F8111B2DCDE494A5F485E5BCA4BD88A2763AED1C" +
      "A2B2FA8F0540678CD1E0F3AD80892"),
  };

  let p512rCommonSpec: cpFw.ECCCommonParamsSpec = {
    algName: "ECC",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    field: fieldFp,
    a: BigInt("0x7830A3318B603B89E2327145AC234CC594CBDD8D3DF91610A83441CAEA9863BC2DED5D5AA8253AA10A2EF1C98B9AC8B57F1" +
      "117A72BF2C7B9E7C1AC4D77FC94CA"),
    b: BigInt("0x3DF91610A83441CAEA9863BC2DED5D5AA8253AA10A2EF1C98B9AC8B57F1117A72BF2C7B9E7C1AC4D77FC94CADC083E67984" +
      "050B75EBAE5DD2809BD638016F723"),
    g: G,
    n: BigInt("0xAADD9DB8DBE9C48B3FD4E6AE33C9FC07CB308DB3B3C9D20ED6639CCA70330870553E5C414CA92619418661197FAC10471DB" +
      "1D381085DDADDB58796829CA90069"),
    h: 1,
  };
  return p512rCommonSpec;
}

export function p512r1Sk() {
  return BigInt('0x24F5F8885529030E9396CB6D14ED85EC7E78AE8345B3D76C0747F723575CEE913ED20DD114BC78211217BD4970C042C08' +
    '14FCD19984C156D8E22E1ED95E3BA1A');
}

export function p512r1Pk() {
  let pk: cpFw.Point = {
    x: BigInt('0x9F107F40721FC6DBD5872E73AB57D8408972879381A8C66A79637FFA5FA0D6D53C6597C3833FCB4C7FBFD2D194BD1024311' +
      'DF217987AE772FCACE1D08B4A3258'),
    y: BigInt('0x54C9E1EFC5E22D2DDFC9C36FEBFC52B566ABB67D93AEECFC2534793E4A56C0A296FCFBEFF4826208DD4F88BF1DDBDEAB6D1' +
      '6F1F67F0CC3079E09E27A1C6268AE')
  }
  return pk;
}

export function genP512t1KeySpec(keyType: cpFw.AsyKeySpecType) {
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
}

export function p512t1Spec(): cpFw.ECCCommonParamsSpec {
  let fieldFp: cpFw.ECFieldFp = {
    fieldType: "Fp",
    p: BigInt("0xAADD9DB8DBE9C48B3FD4E6AE33C9FC07CB308DB3B3C9D20ED6639CCA703308717D4D9B009BC66842AECDA12AE6A380E6288" +
      "1FF2F2D82C68528AA6056583A48F3"),
  };

  let G: cpFw.Point = {
    x: BigInt("0x640ECE5C12788717B9C1BA06CBC2A6FEBA85842458C56DDE9DB1758D39C0313D82BA51735CDB3EA499AA77A7D6943A64F7A" +
      "3F25FE26F06B51BAA2696FA9035DA"),
    y: BigInt("0x5B534BD595F5AF0FA2C892376C84ACE1BB4E3019B71634C01131159CAE03CEE9D9932184BEEF216BD71DF2DADF86A627306" +
      "ECFF96DBB8BACE198B61E00F8B332"),
  };

  let p512tCommonSpec: cpFw.ECCCommonParamsSpec = {
    algName: "ECC",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    field: fieldFp,
    a: BigInt("0xAADD9DB8DBE9C48B3FD4E6AE33C9FC07CB308DB3B3C9D20ED6639CCA703308717D4D9B009BC66842AECDA12AE6A380E6288" +
      "1FF2F2D82C68528AA6056583A48F0"),
    b: BigInt("0x7CBBBCF9441CFAB76E1890E46884EAE321F70C0BCB4981527897504BEC3E36A62BCDFA2304976540F6450085F2DAE145C22" +
      "553B465763689180EA2571867423E"),
    g: G,
    n: BigInt("0xAADD9DB8DBE9C48B3FD4E6AE33C9FC07CB308DB3B3C9D20ED6639CCA70330870553E5C414CA92619418661197FAC10471DB" +
      "1D381085DDADDB58796829CA90069"),
    h: 1,
  };
  return p512tCommonSpec;
}

export function p512t1Sk() {
  return BigInt('0x6196DB1CFD42F60446361BC7C800C452E4805DB367824623CD5E5BEC40EE3DBCD72A8B8380191E5E19DFAA6D08703577C' +
    '52F6B728CF01494D19E8D24E49A5314');
}

export function p512t1Pk() {
  let pk: cpFw.Point = {
    x: BigInt('0x2D4CB9E37762D34A7A5301183EBC41A91332D39BFCE824385F80DE987C02EE667A2B72B66D29BD90269E2A57C1A84697A2D' +
      '786094B675C7C4FE2AF067C041A24'),
    y: BigInt('0x34EE414B9312F9F1ABC3AF3D85F39128D34DB1B66591C0840BD7992296762D1AA16849A4DDF07480CD043BBE3CD70140082' +
      'DE9393B899B0143F2BF56A8AF4DD4')
  }
  return pk;
}

export function genDHKeySpec(keyType: cpFw.AsyKeySpecType): cpFw.AsyKeySpec {
  let dhCommonSpec: cpFw.DHCommonParamsSpec = {
    algName: "DH",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    p: BigInt('0xCCE58315F265EECA8F091E1D73F9B9DFECF5A2F08E0DD27C7D56565834766C0CBCD323E70D3E77DA8B29D6A007A0A7B8F08' +
      '6A31ECE1C794ABBFE2FFDB50551C1AA21448D83B01A995A1175B28D0AF7370A1B2BC40721A44C0905BF98369B66F2547B08865AA4EF61' +
      '286718F1B9DD8944C682B3773AB3B3AD1DD322A102162EE7'),
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
        algName: "Ed25519",
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
}

export function dhSk() {
  return BigInt('0x3A3AF5222552DF84A778CF1AC13A964C4E4ED616B796682771A15ED176CD7EF9');
}

export function dhPk() {
  return BigInt('0xC3B7FB64CEAC3E12F608E66745F2F1F1EB7A5B4C494E96B76739CD6BA4CE31A0');
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
  return BigInt('0x3A3AF5222552DF84A778CF1AC13A964C4E4ED616B796682771A15ED176CD7EF9');
}

export function ed25519Pk() {
  return BigInt('0xC3B7FB64CEAC3E12F608E66745F2F1F1EB7A5B4C494E96B76739CD6BA4CE31A0');
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
  return BigInt('0xB1F526D52FE9D07AD1D209D95FA7D54AFC380401793B8263CA78E98CCA00C93B');
}

export function x25519Pk() {
  return BigInt('0x40A3826E767F6560513C3D08BABA90D81A850B637901EA96826123F927B42F56');
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
    data: new Uint8Array([])
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
    data: new Uint8Array([])
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

