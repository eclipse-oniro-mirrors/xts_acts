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
import { BusinessError } from '@ohos.base';

function genSM2KeySpec(keyType: cpFw.AsyKeySpecType): cpFw.AsyKeySpec {
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


function SM2CommonSpec(): cpFw.ECCCommonParamsSpec {
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

function SM2Sk() {
  return BigInt('0x6330B599ECD23ABDC74B9A5B7B5E00E553005F72743101C5FAB83AEB579B7074');
}

function SM2Pk() {
  let pk: cpFw.Point = {
    x: BigInt('0x67F3B850BDC0BA5D3A29D8A0883C4B17612AB84F87F18E28F77D824A115C02C4'),
    y: BigInt('0xD48966CE754BBBEDD6501A1385E1B205C186E926ADED44287145E8897D4B2071')
  };
  return pk;
}

function genP160r1KeySpec(keyType: cpFw.AsyKeySpecType): cpFw.AsyKeySpec {
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

function p160r1Spec(): cpFw.ECCCommonParamsSpec {
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

function p160r1Sk(): bigint {
  return BigInt('0x2F42EF58CEA26A04488EA7154B4940FE8779D475')
}

function p160r1Pk(): cpFw.Point {
  let pk: cpFw.Point = {
    x: BigInt('0xDE414C3C27380BE3877AC091D61AE1D6FAF9136A'),
    y: BigInt('0x86A01F2C135E0A5A8F063A7147DE4206625AE295')
  }
  return pk
}

function genP160t1KeySpec(keyType: cpFw.AsyKeySpecType) {
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

function p160t1Spec(): cpFw.ECCCommonParamsSpec {
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

function p160t1Sk() {
  return BigInt('0x925BD2FA6B1F0067F191A48E63AF45ED5C2D515D')
}

function p160t1Pk() {
  let pk: cpFw.Point = {
    x: BigInt('0x6A02E029BAFA58E822C7734537FDE4CFB7C5D6ED'),
    y: BigInt('0x774E626917E62C047EE3023A0C03AB4C96D6C77D')
  }
  return pk
}

function genP192r1KeySpec(keyType: cpFw.AsyKeySpecType) {
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

function p192r1Spec(): cpFw.ECCCommonParamsSpec {
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

function p192r1Sk() {
  return BigInt('0x706A736F09839C321436EAFC5EDAB8109611A9FB8AFFFF65')
}

function p192r1Pk() {
  let pk: cpFw.Point = {
    x: BigInt('0xA21E4186D23A245A1745111A9246CED198C8933E1C0CE18D'),
    y: BigInt('0xB324030A65FC7DC46C7982D7E8AA8DCE7D8B9A3053521314')
  }
  return pk
}

function genP192t1KeySpec(keyType: cpFw.AsyKeySpecType) {
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

function p192t1Spec(): cpFw.ECCCommonParamsSpec {
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

function p192t1Sk() {
  return BigInt('0x78F6022C070A1A9C824385CC5614067A325A0200042B3A0C')
}

function p192t1Pk() {
  let pk: cpFw.Point = {
    x: BigInt('0x6EF72555E241F1FD2C134B7868A56434654B61472303D1E8'),
    y: BigInt('0x41492A9D3D0D3728AFEFEDEAC68160FD6746C196A22E37C3')
  }
  return pk
}

function genP224r1KeySpec(keyType: cpFw.AsyKeySpecType) {
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

function p224r1Spec(): cpFw.ECCCommonParamsSpec {
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

function p224r1Sk() {
  return BigInt('0x242570C3A99B1B8EC50049A3216A1A254C2FF0A9059780AA735F66C8')
}

function p224r1Pk() {
  let pk: cpFw.Point = {
    x: BigInt('0xC51851CAB2521B8E6EB934DDBED4179B6D35EAC8F35A0B63F3C90B2D'),
    y: BigInt('0x29F1998DE279FD3A2E76C0C78D567A4312834A67082F21AD7DAD4DD3')
  }
  return pk
}

function genP224t1KeySpec(keyType: cpFw.AsyKeySpecType) {
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

function p224t1Spec(): cpFw.ECCCommonParamsSpec {
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

function p224t1Sk() {
  return BigInt('0xC478D61D983AB1B24EDEB33588BC322D9CA5F6EDA78AE03DDB30BE5C')
}

function p224t1Pk() {
  let pk: cpFw.Point = {
    x: BigInt('0x8970623D819209C38330BBD3868D2FB44C42CD294F03DC559B0A772A'),
    y: BigInt('0xB26E25A8B9C7DDBE8FB3D7FF1578EC67DD76DED0FDAF9789CE726635')
  }
  return pk
}

function genP256r1KeySpec(keyType: cpFw.AsyKeySpecType) {
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

function p256r1Spec(): cpFw.ECCCommonParamsSpec {
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

function p256r1Sk() {
  return BigInt('0x327D0E7BEC81EAE32D8D9207B44A759E5334B57EF7DC0576ABEDB22DF0BA7B82')
}

function p256r1Pk() {
  let pk: cpFw.Point = {
    x: BigInt('0x26B2F508F810DAD4AF35D77252EE81536E38F44C7439D74DB2AD28FE83306173'),
    y: BigInt('0x1F87044FA4259A44A3E606D8A6495E849EA538E9E6FB3D03F06C6F6905E5EDE8')
  }
  return pk
}

function genP256t1KeySpec(keyType: cpFw.AsyKeySpecType) {
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

function p256t1Spec(): cpFw.ECCCommonParamsSpec {
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

function p256t1Sk() {
  return BigInt('0x412F0687E9634D5FBF82D7BC6A7E61913F0444AEBCF7B1F3A2A8AFDA16E2E794')
}

function p256t1Pk() {
  let pk: cpFw.Point = {
    x: BigInt('0xA838502645073AC99991EEB56361AAE1D3B752BB3DA89516F0AA00EC5C6FB63A'),
    y: BigInt('0x39BB65AF17AF838FA620569131D91B48E7A71827A297E857820EE82E0C0A5ABF')
  }
  return pk
}

function genP320r1KeySpec(keyType: cpFw.AsyKeySpecType) {
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

function p320r1Spec(): cpFw.ECCCommonParamsSpec {
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

function p320r1Sk() {
  return BigInt('0x26DFB6E9516C15913A48685F191C341520BA56411E1F947FF1FFA1033F1E3176480005FC89187A71')
}

function p320r1Pk() {
  let pk: cpFw.Point = {
    x: BigInt('0x753B44CCABD1CC59845CBDAF0EC2DD9E008420D341A48DABECD08ED8506FC0759B4847F964ECB26B'),
    y: BigInt('0x108DB6210D842F1F6CA1E33E611EF0D32080309182EF74777F7BCE24A3D97F325BC5AF1F5D15C595')
  }
  return pk
}

function genP320t1KeySpec(keyType: cpFw.AsyKeySpecType) {
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

function p320t1Spec(): cpFw.ECCCommonParamsSpec {
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

function p320t1Sk() {
  return BigInt('0x9A887A14345A7514E36A9C39401674A7CBA57FA100966D2ACD783CADF1D15857F58A322D9DF4F120')
}

function p320t1Pk() {
  let pk: cpFw.Point = {
    x: BigInt('0xCF7C475DDF5C2E1FD7DB0B1901D96AD5FFA45D6A09363362695D6C5575B297BB65CDF8AE20BD7E16'),
    y: BigInt('0xB793CB0E2784FFD10FA4DB893D1E2C9FFDA9E443D91656E3672F025A24150CA0B54C7327401FEFAD')
  }
  return pk
}

function genP384r1KeySpec(keyType: cpFw.AsyKeySpecType) {
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

function p384r1Spec(): cpFw.ECCCommonParamsSpec {
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

function p384r1Sk() {
  return BigInt('0x7203B809A9427A646671FA29B1C953EC1A0EA0A65C90D9D4E639931377B5CAA3D991539328211203ED13F58DDBF2BBDB')
}

function p384r1Pk() {
  let pk: cpFw.Point = {
    x: BigInt('0x1B78803F0C3EC920D841DF918A0CE9007428C6A1BA6127D0CA7F946842059F22965078AF60BDEBFF5169C1E2E4D4797D'),
    y: BigInt('0x6BB57D20DFA6B72C82EE11E76F34B7B163DEE1EE1EFEEB356478682E4C522D07F9474FEABD190D6FA348FBC414B2FF9F')
  }
  return pk
}

function genP384t1KeySpec(keyType: cpFw.AsyKeySpecType) {
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

function p384t1Spec(): cpFw.ECCCommonParamsSpec {
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

function p384t1Sk() {
  return BigInt('0x1FF73742BD596F00CD3FA2EF9D5D3182E7BBCABB1B753250BDB6527F933AB333F89D51433FE6919EAD09D9993062D9DF')
}

function p384t1Pk() {
  let pk: cpFw.Point = {
    x: BigInt('0x86F270888C8DC6C4F5802FA2909576474B4B1D84BC8DD8E29D0BFB9E74E501024AA834B326E0BD331C8FAD23DABD4761'),
    y: BigInt('0x3245A371B58DCF271A4A2EF26648863CABBC85B424D67CAEAC1D66FAD5C4EBF4A21AB715E98EAFE75A649E9AF8C0AB35')
  }
  return pk
}

function genP512r1KeySpec(keyType: cpFw.AsyKeySpecType) {
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

function p512r1Spec(): cpFw.ECCCommonParamsSpec {
  let fieldFp: cpFw.ECFieldFp = {
    fieldType: "Fp",
    p: BigInt("0xAADD9DB8DBE9C48B3FD4E6AE33C9FC07CB308DB3B3C9D20ED6639CCA703308717D4D9B009BC66842AECDA12AE6A380E62881FF2F2D82C68528AA6056583A48F3"),
  };

  let G: cpFw.Point = {
    x: BigInt("0x81AEE4BDD82ED9645A21322E9C4C6A9385ED9F70B5D916C1B43B62EEF4D0098EFF3B1F78E2D0D48D50D1687B93B97D5F7C6D5047406A5E688B352209BCB9F822"),
    y: BigInt("0x7DDE385D566332ECC0EABFA9CF7822FDF209F70024A57B1AA000C55B881F8111B2DCDE494A5F485E5BCA4BD88A2763AED1CA2B2FA8F0540678CD1E0F3AD80892"),
  };

  let p512rCommonSpec: cpFw.ECCCommonParamsSpec = {
    algName: "ECC",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    field: fieldFp,
    a: BigInt("0x7830A3318B603B89E2327145AC234CC594CBDD8D3DF91610A83441CAEA9863BC2DED5D5AA8253AA10A2EF1C98B9AC8B57F1117A72BF2C7B9E7C1AC4D77FC94CA"),
    b: BigInt("0x3DF91610A83441CAEA9863BC2DED5D5AA8253AA10A2EF1C98B9AC8B57F1117A72BF2C7B9E7C1AC4D77FC94CADC083E67984050B75EBAE5DD2809BD638016F723"),
    g: G,
    n: BigInt("0xAADD9DB8DBE9C48B3FD4E6AE33C9FC07CB308DB3B3C9D20ED6639CCA70330870553E5C414CA92619418661197FAC10471DB1D381085DDADDB58796829CA90069"),
    h: 1,
  };
  return p512rCommonSpec;
}

function p512r1Sk() {
  return BigInt('0x24F5F8885529030E9396CB6D14ED85EC7E78AE8345B3D76C0747F723575CEE913ED20DD114BC78211217BD4970C042C0814FCD19984C156D8E22E1ED95E3BA1A')
}

function p512r1Pk() {
  let pk: cpFw.Point = {
    x: BigInt('0x9F107F40721FC6DBD5872E73AB57D8408972879381A8C66A79637FFA5FA0D6D53C6597C3833FCB4C7FBFD2D194BD1024311DF217987AE772FCACE1D08B4A3258'),
    y: BigInt('0x54C9E1EFC5E22D2DDFC9C36FEBFC52B566ABB67D93AEECFC2534793E4A56C0A296FCFBEFF4826208DD4F88BF1DDBDEAB6D16F1F67F0CC3079E09E27A1C6268AE')
  }
  return pk
}

function genP512t1KeySpec(keyType: cpFw.AsyKeySpecType) {
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

function p512t1Spec(): cpFw.ECCCommonParamsSpec {
  let fieldFp: cpFw.ECFieldFp = {
    fieldType: "Fp",
    p: BigInt("0xAADD9DB8DBE9C48B3FD4E6AE33C9FC07CB308DB3B3C9D20ED6639CCA703308717D4D9B009BC66842AECDA12AE6A380E62881FF2F2D82C68528AA6056583A48F3"),
  };

  let G: cpFw.Point = {
    x: BigInt("0x640ECE5C12788717B9C1BA06CBC2A6FEBA85842458C56DDE9DB1758D39C0313D82BA51735CDB3EA499AA77A7D6943A64F7A3F25FE26F06B51BAA2696FA9035DA"),
    y: BigInt("0x5B534BD595F5AF0FA2C892376C84ACE1BB4E3019B71634C01131159CAE03CEE9D9932184BEEF216BD71DF2DADF86A627306ECFF96DBB8BACE198B61E00F8B332"),
  };

  let p512tCommonSpec: cpFw.ECCCommonParamsSpec = {
    algName: "ECC",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    field: fieldFp,
    a: BigInt("0xAADD9DB8DBE9C48B3FD4E6AE33C9FC07CB308DB3B3C9D20ED6639CCA703308717D4D9B009BC66842AECDA12AE6A380E62881FF2F2D82C68528AA6056583A48F0"),
    b: BigInt("0x7CBBBCF9441CFAB76E1890E46884EAE321F70C0BCB4981527897504BEC3E36A62BCDFA2304976540F6450085F2DAE145C22553B465763689180EA2571867423E"),
    g: G,
    n: BigInt("0xAADD9DB8DBE9C48B3FD4E6AE33C9FC07CB308DB3B3C9D20ED6639CCA70330870553E5C414CA92619418661197FAC10471DB1D381085DDADDB58796829CA90069"),
    h: 1,
  };
  return p512tCommonSpec;
}

function p512t1Sk() {
  return BigInt('0x6196DB1CFD42F60446361BC7C800C452E4805DB367824623CD5E5BEC40EE3DBCD72A8B8380191E5E19DFAA6D08703577C52F6B728CF01494D19E8D24E49A5314')
}

function p512t1Pk() {
  let pk: cpFw.Point = {
    x: BigInt('0x2D4CB9E37762D34A7A5301183EBC41A91332D39BFCE824385F80DE987C02EE667A2B72B66D29BD90269E2A57C1A84697A2D786094B675C7C4FE2AF067C041A24'),
    y: BigInt('0x34EE414B9312F9F1ABC3AF3D85F39128D34DB1B66591C0840BD7992296762D1AA16849A4DDF07480CD043BBE3CD70140082DE9393B899B0143F2BF56A8AF4DD4')
  }
  return pk
}

function genDHKeySpec(keyType: cpFw.AsyKeySpecType): cpFw.AsyKeySpec {
  let dhCommonSpec: cpFw.DHCommonParamsSpec = {
    algName: "DH",
    specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC,
    p: BigInt('14388323748509691152339626034387408995039547340824577979064239063608427704932448732076569161306635' +
      '2917481944547405689677246280152410758013777025889764765692851384451416319617692425991236335855348677315061' +
      '390272265742624033974422711563743651130853053024311390237925287317451474937241063690707505697001705975527'),
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

function dhSk() {
  return BigInt('26338314196010394003047705826246263763817858777633584257903027929486581399289')
}

function dhPk() {
  return BigInt('88526073542684289740553502784855485761717378867878721325430646321401727693216')
}

function genEd25519KeySpec(keyType: cpFw.AsyKeySpecType): cpFw.AsyKeySpec {
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

function ed25519Sk() {
  return BigInt('26338314196010394003047705826246263763817858777633584257903027929486581399289')
}

function ed25519Pk() {
  return BigInt('88526073542684289740553502784855485761717378867878721325430646321401727693216')
}

function genX25519KeySpec(keyType: cpFw.AsyKeySpecType): cpFw.AsyKeySpec {
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

function x25519Sk() {
  return BigInt('80492519743984536410287031417673280832731199941643693694014394451502905215291')
}

function x25519Pk() {
  return BigInt('29236918585986399753398384668566812412856019336455282363269457131759906074454')
}

export {
  SM2CommonSpec,
  SM2Sk,
  SM2Pk,
  p160r1Spec,
  p160r1Sk,
  p160r1Pk,
  p160t1Spec,
  p160t1Sk,
  p160t1Pk,
  p192r1Spec,
  p192r1Sk,
  p192r1Pk,
  p192t1Spec,
  p192t1Sk,
  p192t1Pk,
  p224r1Spec,
  p224r1Sk,
  p224r1Pk,
  p224t1Spec,
  p224t1Sk,
  p224t1Pk,
  p256r1Spec,
  p256r1Sk,
  p256r1Pk,
  p256t1Spec,
  p256t1Sk,
  p256t1Pk,
  p320r1Spec,
  p320r1Sk,
  p320r1Pk,
  p320t1Spec,
  p320t1Sk,
  p320t1Pk,
  p384r1Spec,
  p384r1Sk,
  p384r1Pk,
  p384t1Spec,
  p384t1Sk,
  p384t1Pk,
  p512r1Spec,
  p512r1Sk,
  p512r1Pk,
  p512t1Spec,
  p512t1Sk,
  p512t1Pk,
  genSM2KeySpec,
  genP160r1KeySpec,
  genP160t1KeySpec,
  genP192r1KeySpec,
  genP192t1KeySpec,
  genP224r1KeySpec,
  genP224t1KeySpec,
  genP256r1KeySpec,
  genP256t1KeySpec,
  genP320r1KeySpec,
  genP320t1KeySpec,
  genP384r1KeySpec,
  genP384t1KeySpec,
  genP512r1KeySpec,
  genP512t1KeySpec,
  genDHKeySpec,
  genEd25519KeySpec,
  genX25519KeySpec,
}