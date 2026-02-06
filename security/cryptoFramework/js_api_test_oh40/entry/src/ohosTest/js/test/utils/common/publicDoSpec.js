/*
 * Copyright (C) 2022-2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import cryptoFramework from "@ohos.security.cryptoFramework";

// 根据keyType（类型为AsyKeySpecType）生成spec
function genEccKeySpec(keyType) {
    let eccCommonSpec = genEccCommonSpec();
    let p = {
        x: BigInt("0x2e7c6118a06b59004aff9f3b92fb3fd22d7cf2b5bab3ebeaf401c9da"),
        y: BigInt("0x2cd9c521030069f5c66b7ca4cfac5c2e1a1e0bb2a5224208ff439583"),
    };
    switch (keyType) {
        case cryptoFramework.AsyKeySpecType.COMMON_PARAMS_SPEC:
            return eccCommonSpec;
        case cryptoFramework.AsyKeySpecType.PRIVATE_KEY_SPEC:
            let eccPriKeySpec = {
                algName: "ECC",
                specType: cryptoFramework.AsyKeySpecType.PRIVATE_KEY_SPEC,
                params: eccCommonSpec,
                sk: BigInt(
                    "0x1fc30610ce53f731c29d5de87b430c9d8cee5640f68357a14edf6bb6"
                ),
            };
            return eccPriKeySpec;
        case cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC:
            let eccPubKeySpec = {
                algName: "ECC",
                specType: cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC,
                params: eccCommonSpec,
                pk: p,
            };
            return eccPubKeySpec;
        case cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC:
            let eccKeyPairSpec = {
                algName: "ECC",
                specType: cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC,
                params: eccCommonSpec,
                sk: BigInt(
                    "0x1a97f0ab166affebb84009cf1eb1bd518167a4d7ab5b5f95d21d7d17"
                ),
                pk: p,
            };
            return eccKeyPairSpec;
    }
}

function genEccCommonSpec() {
    let fieldFp = {
        fieldType: "Fp",
        p: BigInt("0xffffffffffffffffffffffffffffffff000000000000000000000001"),
    };

    let G = {
        x: BigInt("0xb70e0cbd6bb4bf7f321390b94a03c1d356c21122343280d6115c1d21"),
        y: BigInt("0xbd376388b5f723fb4c22dfe6cd4375a05a07476444d5819985007e34"),
    };

    let eccCommonSpec = {
        algName: "ECC",
        specType: cryptoFramework.AsyKeySpecType.COMMON_PARAMS_SPEC,
        field: fieldFp,
        a: BigInt("0xfffffffffffffffffffffffffffffffefffffffffffffffffffffffe"),
        b: BigInt("0xb4050a850c04b3abf54132565044b0b7d7bfd8ba270b39432355ffb4"),
        g: G,
        n: BigInt("0xffffffffffffffffffffffffffff16a2e0b8f03e13dd29455c5c2a3d"),
        h: 1,
    };
    return eccCommonSpec;
}

// DSA2048 spec大端common数据
function genDsa2048CommonSpecBigE() {
    let dsaCommonSpec = {
        algName: "DSA",
        specType: cryptoFramework.AsyKeySpecType.COMMON_PARAMS_SPEC,
        p: BigInt(
            "0xA025FAADF48EB9E599F35D6F4F8334E27ECF6FBF30AF6F81EBF8C413D9A05D8B5C8EDCC21D0B4132B01FFEEF0CC2A27E" +
            "685C2821E9F5B15812634C194EFF024B92EDD207114D8C58165C558EADA3677DB9866E0BE6546F40AE0E674CF9125B3C087AF7FC6786" +
            "69E70A9440BF8B76FE26D1F2A11A84A1435628BC9A5FD73B69898A362C51DF12772F577BA0AADD7FA1623B407B681A8F0D38BB215D18" +
            "FC0F46F7A3B01D23C3D2C7725118DF469579D9BDB519022C87DCE757827EF18B063D00A57B6B2627910F6A77E4D504E4122C42FFD288" +
            "BBD392A0F9C85164145CD8F96C4782B41C7F09B8F025831D3F3F05B3210A5DA7D854C3657DC3B01DBFAEF868CF9B"
        ),
        q: BigInt("0x97E7334DD3943E0BDB6274C6A108DD19A375171B"),
        g: BigInt(
            "0x2C7816593463F4F392FCB5A54F13DE2F1CA43CAEAD383F7E90BF96A6AE259072F58E800C391CD9ECBA905B3AE8586C9E" +
            "304237023182BC6ADF6A0929E3C046D1CB85EC0C305EEAC8398E229F2210D2346168373D2E4A5B9AF5C148C6F6DC631AD39664BA34C9" +
            "D1A0D1AE6C2F4817931443EDF0213019C31B5FDEA3F0707818E1A8E4EE2E00A5E4B317C80C7D6E42DCB74600364DD446AA3D3C468940" +
            "BF1D84770A75F3871D084CA6D1A91C1E121EE1C7302876A57F6C85962B6FDB806626AEF593C78EAE9AEDE4CA04EA3B72EFDC87ED0DA5" +
            "4C4ADD71226459694E8EBF43DCAB8E66BB01B6F4E7FDD2AD9F36C1A02999D1967059067835BD6555529EF8B2E538"
        ),
    };
    return dsaCommonSpec;
}

// DSA2048 spec大端KeyPair数据
function genDsa2048KeyPairSpecBigE() {
    let dsaCommonSpec = genDsa2048CommonSpecBigE();
    let dsaKeyPairSpec = {
        algName: "DSA",
        specType: cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC,
        params: dsaCommonSpec,
        sk: BigInt("0x326792f6c4e2e2e8a08b6b450c8a76b0eecf91a7"),
        pk: BigInt(
            "0x178fa8118492ec8347c76ab092af5a2037a36479d2d03dcde061888821cc745dce4c5147f0c55c4c827aaf72adb9e0" +
            "53f278b7f0b5487f8a3a18d19f8b7da547b795ab98f87b7450568e57f0eef5b7baab8586f92bef4156a0a49fb73800460aa6f1fc1fd" +
            "84e85449243215d6eccc2cb26310d21c4bd8d24bcd91819d7dcf1e7935048032cae2ee749885f9357279936b420abfca72bf2d998d7" +
            "d4349d9650589aea54f3eef56314ee85837476e15295c3f7eb04047ba7281bccea4a4e84dad89c79d89b66892fcfacd779f9a9d8451" +
            "378b90014c97e22518667b09f261123c838d7701d158e4d4f959740a1c27e011872f410e68d52167ff2c9f8338b33b7ce"
        ),
    };
    return dsaKeyPairSpec;
}

// DSA2048 spec大端KeyPair数据
function genDsaKeyPairSpec(dsap, dsaq, dsag, sk, pk) {
    let dsaCommonSpec = genDsa2048CommonSpecBigE();
    let dsaKeyPairSpec = {
        algName: "DSA",
        specType: cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC,
        params: dsaCommonSpec,
        sk: sk,
        pk: pk,
        p: dsap,
        q: dsaq,
        g: dsag,
    };
    return dsaKeyPairSpec;
}

function genRsaKeyPairSpec(nIn, eIn, dIn) {
    let rsaCommSpec = {
        n: nIn,
        algName: "RSA",
        specType: cryptoFramework.AsyKeySpecType.COMMON_PARAMS_SPEC,
    };
    let rsaKeyPairSpec = {
        params: rsaCommSpec,
        sk: dIn,
        pk: eIn,
        algName: "RSA",
        specType: cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC,
    };
    return rsaKeyPairSpec;
}

// 生成RSA2048密钥对参数
function genRsa2048KeyPairSpec() {
    let nIn = BigInt(
        "0x9260d0750ae117eee55c3f3deaba74917521a262ee76007cdf8a56755ad73a1598a1408410a01434c3f5bc54a88b" +
        "57fa19fc4328daea0750a4c44e88cff3b2382621b80f670464433e4336e6d003e8cd65bff211da144b88291c2259a00a72b711c116ef768" +
        "6e8fee34e4d933c868187bdc26f7be071493c86f7a5941c3510806ad67b0f94d88f5cf5c02a092821d8626e8932b65c5bd8c92049c21093" +
        "2b7afa7ac59c0e886ae5c1edb00d8ce2c57633db26bd6639bff73cee82be9275c402b4cf2a4388da8cf8c64eefe1c5a0f5ab8057c39fa5c" +
        "0589c3e253f0960332300f94bea44877b588e1edbde97cf2360727a09b775262d7ee552b3319b9266f05a25"
    );
    let eIn = BigInt("0x010001");
    let dIn = BigInt(
        "0x6a7df2ca63ead4dda191d614b6b385e0d9056a3d6d5cfe07db1daabee022db08212d97613d3328e0267c9dd23d78" +
        "7abde2afcb306aeb7dfce69246cc73f5c87fdf06030179a2114b767db1f083ff841c025d7dc00cd82435b9a90f695369e94df23d2ce458b" +
        "c3b3283ad8bba2b8fa1ba62e2dce9accff3799aae7c840016f3ba8e0048c0b6cc4339af7161003a5beb864a0164b2c1c9237b64bc875569" +
        "94351b27506c33d4bcdfce0f9c491a7d6b0628c7c852be4f0a9c3132b2ed3a2c8881e9aab07e20e17deb074691be677776a78b5c502e05d" +
        "9bdde72126b3738695e2dd1a0a98a14247c65d8a7ee79432a092cb0721a12df798e44f7cfce0c498147a9b1"
    );
    return genRsaKeyPairSpec(nIn, eIn, dIn);
}

function genRsa2048CommonSpec() {
    let nIn = BigInt(
        "0x9260d0750ae117eee55c3f3deaba74917521a262ee76007cdf8a56755ad73a1598a1408410a01434c3f5bc54a88" +
        "b57fa19fc4328daea0750a4c44e88cff3b2382621b80f670464433e4336e6d003e8cd65bff211da144b88291c2259a00a72b711c116ef7" +
        "686e8fee34e4d933c868187bdc26f7be071493c86f7a5941c3510806ad67b0f94d88f5cf5c02a092821d8626e8932b65c5bd8c92049c21" +
        "0932b7afa7ac59c0e886ae5c1edb00d8ce2c57633db26bd6639bff73cee82be9275c402b4cf2a4388da8cf8c64eefe1c5a0f5ab8057c39" +
        "fa5c0589c3e253f0960332300f94bea44877b588e1edbde97cf2360727a09b775262d7ee552b3319b9266f05a25"
    );
    return genRsaCommonSpec(nIn);
}

function genRsaCommonSpec(nIn) {
    let rsaCommSpec = {
        n: nIn,
        algName: "RSA",
        specType: cryptoFramework.AsyKeySpecType.COMMON_PARAMS_SPEC,
    };
    return rsaCommSpec;
}

function genRsa2048PubKetSpec() {
    let nIn = BigInt(
        "0x9260d0750ae117eee55c3f3deaba74917521a262ee76007cdf8a56755ad73a1598a1408410a01434c3f5bc54a88" +
        "b57fa19fc4328daea0750a4c44e88cff3b2382621b80f670464433e4336e6d003e8cd65bff211da144b88291c2259a00a72b711c116ef7" +
        "686e8fee34e4d933c868187bdc26f7be071493c86f7a5941c3510806ad67b0f94d88f5cf5c02a092821d8626e8932b65c5bd8c92049c21" +
        "0932b7afa7ac59c0e886ae5c1edb00d8ce2c57633db26bd6639bff73cee82be9275c402b4cf2a4388da8cf8c64eefe1c5a0f5ab8057c39" +
        "fa5c0589c3e253f0960332300f94bea44877b588e1edbde97cf2360727a09b775262d7ee552b3319b9266f05a25"
    );
    let eIn = BigInt("0x010001");
    return genRSAPubKeySpec(nIn, eIn);
}

function genRSAPubKeySpec(nIn, eIn) {
    let rsaCommSpec = {
        n: nIn,
        algName: "RSA",
        specType: cryptoFramework.AsyKeySpecType.COMMON_PARAMS_SPEC,
    };
    let rsaPubKeySpec = {
        params: rsaCommSpec,
        pk: eIn,
        algName: "RSA",
        specType: cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC,
    };
    return rsaPubKeySpec;
}

function genRSAPriKeySpec(nIn, dIn) {
    let rsaCommSpec = {
        n: nIn,
        algName: "RSA",
        specType: cryptoFramework.AsyKeySpecType.COMMON_PARAMS_SPEC,
    };
    let rsaPriKeySpec = {
        params: rsaCommSpec,
        sk: dIn,
        algName: "RSA",
        specType: cryptoFramework.AsyKeySpecType.PRIVATE_KEY_SPEC,
    };
    return rsaPriKeySpec;
}

function genDsa2048PubKeySpecBigE() {
    let dsaCommonSpec = genDsa2048CommonSpecBigE();
    let dsaPubKeySpec = {
        algName: "DSA",
        specType: cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC,
        params: dsaCommonSpec,
        pk: BigInt(
            "0x178fa8118492ec8347c76ab092af5a2037a36479d2d03dcde061888821cc745dce4c5147f0c55c4c827aaf72adb9e05" +
            "3f278b7f0b5487f8a3a18d19f8b7da547b795ab98f87b7450568e57f0eef5b7baab8586f92bef4156a0a49fb73800460aa6f1fc1fd84" +
            "e85449243215d6eccc2cb26310d21c4bd8d24bcd91819d7dcf1e7935048032cae2ee749885f9357279936b420abfca72bf2d998d7d43" +
            "49d9650589aea54f3eef56314ee85837476e15295c3f7eb04047ba7281bccea4a4e84dad89c79d89b66892fcfacd779f9a9d8451378b" +
            "90014c97e22518667b09f261123c838d7701d158e4d4f959740a1c27e011872f410e68d52167ff2c9f8338b33b7ce"
        ),
    };
    return dsaPubKeySpec;
}

function genDsa2048PriKeySpecBigE() {
    let dsaCommonSpec = genDsa2048CommonSpecBigE();
    let dsaPriKeySpec = {
        algName: "DSA",
        specType: cryptoFramework.AsyKeySpecType.PRIVATE_KEY_SPEC,
        params: dsaCommonSpec,
        sk: BigInt("0x326792f6c4e2e2e8a08b6b450c8a76b0eecf91a7"),
    };
    return dsaPriKeySpec;
}

export {
    genEccKeySpec,
    genEccCommonSpec,
    genDsa2048CommonSpecBigE,
    genDsa2048KeyPairSpecBigE,
    genDsaKeyPairSpec,
    genDsa2048PubKeySpecBigE,
    genDsa2048PriKeySpecBigE,
    genRsa2048KeyPairSpec,
    genRsaKeyPairSpec,
    genRsaCommonSpec,
    genRsa2048CommonSpec,
    genRSAPubKeySpec,
    genRsa2048PubKetSpec,
    genRSAPriKeySpec,
};
