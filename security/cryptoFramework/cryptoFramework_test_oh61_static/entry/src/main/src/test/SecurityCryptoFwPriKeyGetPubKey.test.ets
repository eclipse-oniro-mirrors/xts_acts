/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import { cryptoFramework } from '@kit.CryptoArchitectureKit';
import { BusinessError } from '@ohos.base';
import {
  convertKeyPair,
  convertPemKeyPair,
  ECC_256_PRIVATE_KEY_DER,
  ECC_256_PRIVATE_KEY_PEM,
  ECC_256_PUBLIC_CERT_PEM,
  ECC_256_PUBLIC_KEY_DER,
  ECC_256_PUBLIC_KEY_PEM,
  generatorKeyPair,
  getKeySpecItem,
  getPubKey,
  getPubKeySync,
  RSA_3072_PRIVATE_KEY_DER,
  RSA_3072_PRIVATE_KEY_PEM,
  RSA_3072_PUBLIC_ENCODED,
  RSA_3072_PUBLIC_KEY_DER,
  RSA_3072_PUBLIC_KEY_PEM,
  SM2_ENC_PRIVATE_KEY_PEM,
  SM2_PRIVATE_KEY_DER,
  SM2_PUBLIC_KEY_DER} from './utils/asymKey/asymKey';
import { compareDataBlob, compareString,
  compareUint8Array,
  createFullData, decToHexString,
  stringToUint8Array } from './utils/common/commonUtils';
import { doSignature, doVerify } from './utils/signature/signature';
import { doCipher } from './utils/cipher/cipher';
import { doKeyAgreement } from './utils/keyAgreement/keyAgreement';
import { agreementAlgSpec, AsyEncryptAlgSpec, signAlgSpec } from './utils/specifications/specifications';
import { cert } from '@kit.DeviceCertificateKit';

export default function SecurityCryptoFwPriKeyToPubKeyTestUnit() {
  describe('SecurityCryptoFwPriKeyToPubKeyTestUnit', () => {

    /**
     * @tc.name   SUB_Security_CryptoFramework_PriKeyToPubKey_Func_0100
     * @tc.number SUB_Security_CryptoFramework_PriKeyToPubKey_Func_0100
     * @tc.desc   generateKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_PriKeyToPubKey_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        for (let element of signAlgSpec) {
          let algName: string = element.split("|")[0];
          let signAlgName: string = element;
          let msgLen: int = 16;
          /* 通过generate生成密钥对keyPair */
          let keyPair: cryptoFramework.KeyPair = await generatorKeyPair(algName);
          /* 通过keyPair里的私钥对象获取公钥 */
          let pubKey: cryptoFramework.PubKey = getPubKeySync(keyPair.priKey);
          /* 对消息签名 */
          let message: cryptoFramework.DataBlob = await createFullData(msgLen);
          let signatureData: cryptoFramework.DataBlob = await doSignature(signAlgName, message, keyPair.priKey);
          /* 销毁私钥 */
          keyPair.priKey.clearMem();
          /* 签名数据验签 */
          let ret: boolean = await doVerify(signAlgName, signatureData, message, pubKey);
          expect(ret).assertTrue();
        }
      } catch (error: BusinessError) {
        console.error(`[XTS] Func_0100 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_PriKeyToPubKey_Func_0200
     * @tc.number SUB_Security_CryptoFramework_PriKeyToPubKey_Func_0200
     * @tc.desc   generateKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_PriKeyToPubKey_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          for (let element of AsyEncryptAlgSpec) {
            let algName: string = element.split("|")[0];
            let encAlgName: string = element;
            let msgLen: int = 16;
            /* 通过generate生成密钥对keyPair */
            let keyPair: cryptoFramework.KeyPair = await generatorKeyPair(algName);
            /* 通过keyPair里的私钥对象获取公钥 */
            let pubKey: cryptoFramework.PubKey = await getPubKey(keyPair.priKey);
            /* 对消息加密 */
            let message: cryptoFramework.DataBlob = await createFullData(msgLen);
            let cipherData: cryptoFramework.DataBlob =
              await doCipher(encAlgName, true, message, null, pubKey);
            /* 密文解密 */
            let plainData: cryptoFramework.DataBlob = await doCipher(encAlgName, false, cipherData, keyPair.priKey, null);
            /* 一致性对比 */
            let ret: boolean = compareDataBlob(plainData, message);
            expect(ret).assertTrue();
            /* 销毁私钥 */
            keyPair.priKey.clearMem();
          }
        } catch (error: BusinessError) {
          console.error(`[XTS] Func_0200 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_PriKeyToPubKey_Func_0300
     * @tc.number SUB_Security_CryptoFramework_PriKeyToPubKey_Func_0300
     * @tc.desc   generateKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_PriKeyToPubKey_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          for (let element of agreementAlgSpec) {
            let algName: string = element;
            /* 通过generate生成密钥对keyPair */
            let keyPair: cryptoFramework.KeyPair = await generatorKeyPair(algName);
            /* 通过keyPair里的私钥对象获取公钥 */
            let pubKey: cryptoFramework.PubKey = await getPubKey(keyPair.priKey);
            /* 密钥协商 */
            let secret1: cryptoFramework.DataBlob = await doKeyAgreement(algName, keyPair.priKey, pubKey);
            let secret2: cryptoFramework.DataBlob = await doKeyAgreement(algName, keyPair.priKey, keyPair.pubKey);
            /* 销毁私钥 */
            keyPair.priKey.clearMem();
            /* 一致性对比 */
            let ret: boolean = compareDataBlob(secret1, secret2);
            expect(ret).assertTrue();
          }
        } catch (error: BusinessError) {
          console.error(`[XTS] Func_0300 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_PriKeyToPubKey_Func_0400
     * @tc.number SUB_Security_CryptoFramework_PriKeyToPubKey_Func_0400
     * @tc.desc   convertKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_PriKeyToPubKey_Func_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "RSA3072";
          let signAlgName: string = "RSA3072|PKCS1|SHA512";
          let msgLen: int = 16;
          /* 通过generate生成密钥对keyPair */
          let keyPair: cryptoFramework.KeyPair = await convertPemKeyPair(algName, RSA_3072_PRIVATE_KEY_PEM, null, null);
          /* 通过keyPair里的私钥对象获取公钥 */
          let pubKey: cryptoFramework.PubKey = await getPubKey(keyPair.priKey);
          /* 对消息签名 */
          let message: cryptoFramework.DataBlob = await createFullData(msgLen);
          let signatureData: cryptoFramework.DataBlob = await doSignature(signAlgName, message, keyPair.priKey);
          /* 销毁私钥 */
          keyPair.priKey.clearMem();
          /* 签名数据验签 */
          let ret: boolean = await doVerify(signAlgName, signatureData, message, pubKey);
          expect(ret).assertTrue();
        } catch (error: BusinessError) {
          console.error(`[XTS] Func_0400 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_PriKeyToPubKey_Func_0500
     * @tc.number SUB_Security_CryptoFramework_PriKeyToPubKey_Func_0500
     * @tc.desc   convertKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_PriKeyToPubKey_Func_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "SM2_256";
          let encAlgName: string = "SM2_256|SM3";
          let msgLen: int = 16;
          let pubKeyBlob: cryptoFramework.DataBlob = {data: new Uint8Array(SM2_PRIVATE_KEY_DER)};
          /* 通过generate生成密钥对keyPair */
          let keyPair: cryptoFramework.KeyPair =
            await convertKeyPair(algName, pubKeyBlob, null);
          /* 通过keyPair里的私钥对象获取公钥 */
          let pubKey: cryptoFramework.PubKey = getPubKeySync(keyPair.priKey);
          /* 对消息加密 */
          let message: cryptoFramework.DataBlob = await createFullData(msgLen);
          let cipherData: cryptoFramework.DataBlob =
            await doCipher(encAlgName, true, message, null, pubKey);
          /* 密文解密 */
          let plainData: cryptoFramework.DataBlob = await doCipher(encAlgName, false, cipherData, keyPair.priKey, null);
          /* 一致性对比 */
          let ret: boolean = compareDataBlob(plainData, message);
          expect(ret).assertTrue();
          /* 销毁私钥 */
          keyPair.priKey.clearMem();
        } catch (error: BusinessError) {
          console.error(`[XTS] Func_0500 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_PriKeyToPubKey_Func_0600
     * @tc.number SUB_Security_CryptoFramework_PriKeyToPubKey_Func_0600
     * @tc.desc   convertKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_PriKeyToPubKey_Func_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "ECC256";
          /* 通过generate生成密钥对keyPair */
          let keyPair: cryptoFramework.KeyPair =
            await convertPemKeyPair(algName, ECC_256_PRIVATE_KEY_PEM, ECC_256_PUBLIC_KEY_PEM, null);
          /* 通过keyPair里的私钥对象获取公钥 */
          let pubKey: cryptoFramework.PubKey = await getPubKey(keyPair.priKey);
          /* 密钥协商 */
          let secret1: cryptoFramework.DataBlob = await doKeyAgreement(algName, keyPair.priKey, pubKey);
          let secret2: cryptoFramework.DataBlob = await doKeyAgreement(algName, keyPair.priKey, keyPair.pubKey);
          /* 销毁私钥 */
          keyPair.priKey.clearMem();
          /* 一致性对比 */
          let ret: boolean = compareDataBlob(secret1, secret2);
          expect(ret).assertTrue();

        } catch (error: BusinessError) {
          console.error(`[XTS] Func_0600 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_PriKeyToPubKey_Func_0700
     * @tc.number SUB_Security_CryptoFramework_PriKeyToPubKey_Func_0700
     * @tc.desc   specByKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_PriKeyToPubKey_Func_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "NID_brainpoolP256r1";
          let signAlgName: string = "ECC256|SHA384";
          let msgLen: int = 16;
          let commonSpec: cryptoFramework.ECCCommonParamsSpec =
            cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(algName);
          let spec: cryptoFramework.ECCPriKeySpec = {
            algName: "ECC",
            specType: cryptoFramework.AsyKeySpecType.PRIVATE_KEY_SPEC,
            params: commonSpec,
            sk: BigInt('60973343002440452103152111577670040407720784535322768598946938973511612119499')
          };
          let generator: cryptoFramework.AsyKeyGeneratorBySpec = cryptoFramework.createAsyKeyGeneratorBySpec(spec);
          let priKey: cryptoFramework.PriKey = await generator.generatePriKey();
          /* 通过keyPair里的私钥对象获取公钥 */
          let pubKey: cryptoFramework.PubKey = getPubKeySync(priKey);
          /* 对消息签名 */
          let message: cryptoFramework.DataBlob = await createFullData(msgLen);
          let signatureData: cryptoFramework.DataBlob = await doSignature(signAlgName, message, priKey);
          /* 销毁私钥 */
          priKey.clearMem();
          /* 签名数据验签 */
          let ret: boolean = await doVerify(signAlgName, signatureData, message, pubKey);
          expect(ret).assertTrue();
        } catch (error: BusinessError) {
          console.error(`[XTS] Func_0700 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_PriKeyToPubKey_Func_0800
     * @tc.number SUB_Security_CryptoFramework_PriKeyToPubKey_Func_0800
     * @tc.desc   specByKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_PriKeyToPubKey_Func_0800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "Ed25519";
          let msgLen: int = 16;
          let spec: cryptoFramework.ED25519PriKeySpec = {
            algName: "Ed25519",
            specType: cryptoFramework.AsyKeySpecType.PRIVATE_KEY_SPEC,
            sk: BigInt('107935528345300154660677491089115743492098642500490631838337086295400281034399')
          };
          let generator: cryptoFramework.AsyKeyGeneratorBySpec = cryptoFramework.createAsyKeyGeneratorBySpec(spec);
          let priKey: cryptoFramework.PriKey = await generator.generatePriKey();
          /* 通过keyPair里的私钥对象获取公钥 */
          let pubKey: cryptoFramework.PubKey = await getPubKey(priKey);
          /* 对消息签名 */
          let message: cryptoFramework.DataBlob = await createFullData(msgLen);
          let signatureData: cryptoFramework.DataBlob = await doSignature(algName, message, priKey);
          /* 销毁私钥 */
          priKey.clearMem();
          /* 签名数据验签 */
          let ret: boolean = await doVerify(algName, signatureData, message, pubKey);
          expect(ret).assertTrue();
        } catch (error: BusinessError) {
          console.error(`[XTS] Func_0800 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_PriKeyToPubKey_Func_1000
     * @tc.number SUB_Security_CryptoFramework_PriKeyToPubKey_Func_1000
     * @tc.desc   specByKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_PriKeyToPubKey_Func_1000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "DSA1024|SHA256";
          let msgLen: int = 16;
          let commonSpec: cryptoFramework.DSACommonParamsSpec = {
            algName: "DSA",
            specType: cryptoFramework.AsyKeySpecType.COMMON_PARAMS_SPEC,
            p: BigInt(
              "160351898206103017524017502689595254164625275701916170477001033692949455242232589517921877153225255510361860919891422325120338266352146341546812844511068183031719613479377770026522723559091048041298098207332539454005449221073320274107712086203518277593262572520666525928004213511284148919779731863918532996453"
            ),
            q: BigInt("881210414560614571141496306241285393251243548309"),
            g: BigInt(
              "154236979015536691594394068775516135644082569687733743975747832467500480471455356360694698355762884244642737180753228537199081941348519366493545053000406886212421554849166527533918968117089038284798311535427580116175349763623668823439937300769109066149499469346437582210761286130235521285387129757881255872432"
            ),
          };
          let spec: cryptoFramework.DSAKeyPairSpec = {
            algName: "DSA",
            params: commonSpec,
            specType: cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC,
            sk: BigInt('772436318512660544630671351190982167235536143743'),
            pk: BigInt('75170106378045125917209332263427541582447345458994665853189618438374526772383805550953052941038322912136141259243664959105261492577423556774093772384668044586016881204183402204947602885195918383749306487342210236900215244919832511453412515807427894164047831830064668041417198196949064643978316353871886621389')
          };
          let generator: cryptoFramework.AsyKeyGeneratorBySpec = cryptoFramework.createAsyKeyGeneratorBySpec(spec);
          let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
          /* 通过keyPair里的私钥对象获取公钥 */
          let pubKey: cryptoFramework.PubKey = getPubKeySync(keyPair.priKey);
          /* 对消息签名 */
          let message: cryptoFramework.DataBlob = await createFullData(msgLen);
          let signatureData: cryptoFramework.DataBlob = await doSignature(algName, message, keyPair.priKey);
          /* 销毁私钥 */
          keyPair.priKey.clearMem();
          /* 签名数据验签 */
          let ret: boolean = await doVerify(algName, signatureData, message, pubKey);
          expect(ret).assertTrue();
        } catch (error: BusinessError) {
          console.error(`[XTS] Func_1000 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_PriKeyToPubKey_Func_1100
     * @tc.number SUB_Security_CryptoFramework_PriKeyToPubKey_Func_1100
     * @tc.desc   specByKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_PriKeyToPubKey_Func_1100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let encAlgName: string = "RSA3072|PKCS1|SHA256";
          let msgLen: int = 16;
          let commonSpec: cryptoFramework.RSACommonParamsSpec = {
            algName: "RSA",
            specType: cryptoFramework.AsyKeySpecType.COMMON_PARAMS_SPEC,
            n: BigInt('4161052736375063154318202847056480611714307683799132330194125373657327197158184076093912766951282061923559096504439972787260309460733548188080444217727920560586060177588408054861864311083198253740502017959294523923367633723628976868828120465284554713769986411694538296237115411677458566608877050164944452540404423436621824864868030998250160979028858941028425245966048248546027828753613997205530272155953503106294541523531870235578923065973469393794143790297388400370095037292158432767072635624353565323500299273259210209563523264730536685633063089609966279813141272378640889607921211647525701183565863384688166058436706864874364543166144490927398333276873129463142380150435929092827758834635541993399981251167875751179536046625815936269763501253994707924485319774745788487012699867770214888884554167739378477745547866734955712101675853929373939478551975584615026354269941996849343472266604382631422204386874831154170781181947')
          };
          let spec: cryptoFramework.RSAKeyPairSpec = {
            algName: "RSA",
            specType: cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC,
            params: commonSpec,
            sk: BigInt('630345172448107588020066799908093741140113930829268745505092950694568631664349169285447395368911123651938518853412271691287674936694732233871899082863158144643459502923504511477006711940338927066171842383689763545954100242735988561480165097263302549678935946035115678243466771550937770256388472985299426657020234613711056002844344595428957660555083564498378104611912767010466824600849592814082190853476759370115998722029150063305118455208273252385496125090749835943422459477806176936104489333605975501777101704706083845979373736417907190930188317085322999369867578506960236245833198775218588593515939772980145599711501451737494136775060571918748356383593251280112994742233783991510968234303232918619934583084036009375672559750932083357054298082520054717747612324359565985417595515037390558941930891145146944341796670226035088525943215314168111089531081619902433987114533747584279723758054504627471496268561393852736621957633'),
            pk: BigInt('65537')
          };
          let generator: cryptoFramework.AsyKeyGeneratorBySpec = cryptoFramework.createAsyKeyGeneratorBySpec(spec);
          let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
          /* 通过keyPair里的私钥对象获取公钥 */
          let pubKey: cryptoFramework.PubKey = await getPubKey(keyPair.priKey);
          /* 对消息加密 */
          let message: cryptoFramework.DataBlob = await createFullData(msgLen);
          let cipherData: cryptoFramework.DataBlob =
            await doCipher(encAlgName, true, message, null, pubKey);
          /* 密文解密 */
          let plainData: cryptoFramework.DataBlob = await doCipher(encAlgName, false, cipherData, keyPair.priKey, null);
          /* 一致性对比 */
          let ret: boolean = compareDataBlob(plainData, message);
          expect(ret).assertTrue();
          /* 销毁私钥 */
          keyPair.priKey.clearMem();
        } catch (error: BusinessError) {
          console.error(`[XTS] Func_1100 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_PriKeyToPubKey_Func_1200
     * @tc.number SUB_Security_CryptoFramework_PriKeyToPubKey_Func_1200
     * @tc.desc   specByKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_PriKeyToPubKey_Func_1200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "DH_modp1536";
          let commonSpec: cryptoFramework.DHCommonParamsSpec = {
            algName: "DH",
            specType: cryptoFramework.AsyKeySpecType.COMMON_PARAMS_SPEC,
            p: BigInt('2104794113008641364258921585285167505347059450055878511123230962835826142065522432721177949013717420177382764484668129082166306255788935651166419492607517300571310225836534537323304558051210016447023825201892076296373548693257931799021361690911349903430113199799685074666605422695389516688629418125923103008383178971427360734064434122385620681237472548814249914757417119600514449676938718002273384774518890871680705700618052134225716708680906606014770983965336707'),
            g: BigInt('2'),
            l: 1536
          };
          let spec: cryptoFramework.DHKeyPairSpec = {
            algName: "DH",
            specType: cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC,
            params: commonSpec,
            sk: BigInt('951127432894475138002697593412073969246723457560577011336539957779315024707566450061622670172637194344479803926926608511337446575899317283967004497781389310672246503977808975771034173101996997942702946305351851693910151956765204201776794574148556664813157206139743606666631394185878143712960142461927319950696112615844620865502553191970159534943149339201824107443878787677847222800418420148090693822245230065489163183658504801527729735719282757591346523921287502'),
            pk: BigInt('2059344396319411278134183770056532235247603754929166359822829553902924033243801227624644638561525880678108459419634604771464515006699412369023493003139555640025129200783759855670006839817607967300773317326593710615272238664787245654878901990056503053544111026328320571132770015205688860742538368550475017046859807399833661901157083871784736257490644367816036382886591176701045252928242983464220303490069562268945766207158439500385755337595297372630649665661382750')
          };
          let generator: cryptoFramework.AsyKeyGeneratorBySpec = cryptoFramework.createAsyKeyGeneratorBySpec(spec);
          let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
          /* 通过keyPair里的私钥对象获取公钥 */
          let pubKey: cryptoFramework.PubKey = await getPubKey(keyPair.priKey);
          /* 密钥协商 */
          let secret1: cryptoFramework.DataBlob = await doKeyAgreement(algName, keyPair.priKey, pubKey);
          let secret2: cryptoFramework.DataBlob = await doKeyAgreement(algName, keyPair.priKey, keyPair.pubKey);
          /* 销毁私钥 */
          keyPair.priKey.clearMem();
          /* 一致性对比 */
          let ret: boolean = compareDataBlob(secret1, secret2);
          expect(ret).assertTrue();
        } catch (error: BusinessError) {
          console.error(`[XTS] Func_1200 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_PriKeyToPubKey_Func_1300
     * @tc.number SUB_Security_CryptoFramework_PriKeyToPubKey_Func_1300
     * @tc.desc   generateKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_PriKeyToPubKey_Func_1300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "RSA512";
          /* 通过generate生成密钥对keyPair */
          let keyPair: cryptoFramework.KeyPair = await generatorKeyPair(algName);
          /* 通过keyPair里的私钥对象获取公钥 */
          let pubKey: cryptoFramework.PubKey = await getPubKey(keyPair.priKey);
          let ret: boolean = getKeySpecItem(pubKey, cryptoFramework.AsyKeySpecItem.RSA_N_BN);
          expect(ret).assertTrue();
          ret = getKeySpecItem(pubKey, cryptoFramework.AsyKeySpecItem.RSA_PK_BN);
          expect(ret).assertTrue();
          getKeySpecItem(pubKey, cryptoFramework.AsyKeySpecItem.RSA_SK_BN);
        } catch (error: BusinessError) {
          console.error(`[XTS] Func_1300 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_PriKeyToPubKey_Func_1400
     * @tc.number SUB_Security_CryptoFramework_PriKeyToPubKey_Func_1400
     * @tc.desc   generateKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_PriKeyToPubKey_Func_1400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "DSA1024";
          /* 通过generate生成密钥对keyPair */
          let keyPair: cryptoFramework.KeyPair = await generatorKeyPair(algName);
          /* 通过keyPair里的私钥对象获取公钥 */
          let pubKey: cryptoFramework.PubKey = await getPubKey(keyPair.priKey);
          let ret: boolean = getKeySpecItem(pubKey, cryptoFramework.AsyKeySpecItem.DSA_Q_BN)
          expect(ret).assertTrue();
          ret = getKeySpecItem(pubKey, cryptoFramework.AsyKeySpecItem.DSA_P_BN);
          expect(ret).assertTrue();
          ret = getKeySpecItem(pubKey, cryptoFramework.AsyKeySpecItem.DSA_G_BN);
          expect(ret).assertTrue();
          ret = getKeySpecItem(pubKey, cryptoFramework.AsyKeySpecItem.DSA_PK_BN);
          expect(ret).assertTrue();
          getKeySpecItem(pubKey, cryptoFramework.AsyKeySpecItem.DSA_SK_BN);
        } catch (error: BusinessError) {
          console.error(`[XTS] Func_1400 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_PriKeyToPubKey_Func_1500
     * @tc.number SUB_Security_CryptoFramework_PriKeyToPubKey_Func_1500
     * @tc.desc   generateKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_PriKeyToPubKey_Func_1500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "DH_modp1536";
          let keyPair: cryptoFramework.KeyPair = await generatorKeyPair(algName);
          let pubKey: cryptoFramework.PubKey = await getPubKey(keyPair.priKey);
          let ret: boolean = getKeySpecItem(pubKey, cryptoFramework.AsyKeySpecItem.DH_P_BN)
          expect(ret).assertTrue();
          ret = getKeySpecItem(pubKey, cryptoFramework.AsyKeySpecItem.DH_G_BN);
          expect(ret).assertTrue();
          ret = getKeySpecItem(pubKey, cryptoFramework.AsyKeySpecItem.DH_PK_BN);
          expect(ret).assertTrue();
          getKeySpecItem(pubKey, cryptoFramework.AsyKeySpecItem.DH_L_NUM);
        } catch (error: BusinessError) {
          console.error(`[XTS] Func_1500 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.NOT_SUPPORT);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_PriKeyToPubKey_Func_1600
     * @tc.number SUB_Security_CryptoFramework_PriKeyToPubKey_Func_1600
     * @tc.desc   generateKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_PriKeyToPubKey_Func_1600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "ECC256";
          let keyPair: cryptoFramework.KeyPair = await generatorKeyPair(algName);
          let pubKey: cryptoFramework.PubKey = await getPubKey(keyPair.priKey);
          let ret: boolean = getKeySpecItem(pubKey, cryptoFramework.AsyKeySpecItem.ECC_FP_P_BN)
          expect(ret).assertTrue();
          ret = getKeySpecItem(pubKey, cryptoFramework.AsyKeySpecItem.ECC_A_BN);
          expect(ret).assertTrue();
          ret = getKeySpecItem(pubKey, cryptoFramework.AsyKeySpecItem.ECC_B_BN);
          expect(ret).assertTrue();
          ret = getKeySpecItem(pubKey, cryptoFramework.AsyKeySpecItem.ECC_G_X_BN);
          expect(ret).assertTrue();
          ret = getKeySpecItem(pubKey, cryptoFramework.AsyKeySpecItem.ECC_G_Y_BN);
          expect(ret).assertTrue();
          ret = getKeySpecItem(pubKey, cryptoFramework.AsyKeySpecItem.ECC_N_BN);
          expect(ret).assertTrue();
          ret = getKeySpecItem(pubKey, cryptoFramework.AsyKeySpecItem.ECC_H_NUM);
          expect(ret).assertTrue();
          ret = getKeySpecItem(pubKey, cryptoFramework.AsyKeySpecItem.ECC_PK_X_BN);
          expect(ret).assertTrue();
          ret = getKeySpecItem(pubKey, cryptoFramework.AsyKeySpecItem.ECC_PK_Y_BN);
          expect(ret).assertTrue();
          ret = getKeySpecItem(pubKey, cryptoFramework.AsyKeySpecItem.ECC_FIELD_TYPE_STR);
          expect(ret).assertTrue();
          ret = getKeySpecItem(pubKey, cryptoFramework.AsyKeySpecItem.ECC_FIELD_SIZE_NUM);
          expect(ret).assertTrue();
          ret = getKeySpecItem(pubKey, cryptoFramework.AsyKeySpecItem.ECC_CURVE_NAME_STR);
          expect(ret).assertTrue();
          getKeySpecItem(pubKey, cryptoFramework.AsyKeySpecItem.ECC_SK_BN);
        } catch (error: BusinessError) {
          console.error(`[XTS] Func_1600 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_PriKeyToPubKey_Func_1700
     * @tc.number SUB_Security_CryptoFramework_PriKeyToPubKey_Func_1700
     * @tc.desc   generateKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_PriKeyToPubKey_Func_1700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "Ed25519";
          let keyPair: cryptoFramework.KeyPair = await generatorKeyPair(algName);
          let pubKey: cryptoFramework.PubKey = await getPubKey(keyPair.priKey);
          let ret: boolean = getKeySpecItem(pubKey, cryptoFramework.AsyKeySpecItem.ED25519_PK_BN);
          expect(ret).assertTrue();
          getKeySpecItem(pubKey, cryptoFramework.AsyKeySpecItem.ED25519_SK_BN);
        } catch (error: BusinessError) {
          console.error(`[XTS] Func_1700 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_PriKeyToPubKey_Func_1800
     * @tc.number SUB_Security_CryptoFramework_PriKeyToPubKey_Func_1800
     * @tc.desc   generateKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_PriKeyToPubKey_Func_1800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "X25519";
          let keyPair: cryptoFramework.KeyPair = await generatorKeyPair(algName);
          let pubKey: cryptoFramework.PubKey = await getPubKey(keyPair.priKey);
          let ret: boolean = getKeySpecItem(pubKey, cryptoFramework.AsyKeySpecItem.X25519_PK_BN);
          expect(ret).assertTrue();
          getKeySpecItem(pubKey, cryptoFramework.AsyKeySpecItem.X25519_SK_BN);
        } catch (error: BusinessError) {
          console.error(`[XTS] Func_1800 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_PriKeyToPubKey_Func_1900
     * @tc.number SUB_Security_CryptoFramework_PriKeyToPubKey_Func_1900
     * @tc.desc   generateKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_PriKeyToPubKey_Func_1900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "ECC256";
          let priKeyBlob: cryptoFramework.DataBlob = {data: new Uint8Array(ECC_256_PRIVATE_KEY_DER)};
          let pubKeyBlob: cryptoFramework.DataBlob = {data: new Uint8Array(ECC_256_PUBLIC_KEY_DER)};
          let keyPair: cryptoFramework.KeyPair = await convertKeyPair(algName, priKeyBlob, pubKeyBlob);
          let pubKey: cryptoFramework.PubKey = await getPubKey(keyPair.priKey);
          let data1: cryptoFramework.DataBlob = pubKey.getEncodedDer("X509|UNCOMPRESSED");
          let data2: cryptoFramework.DataBlob = keyPair.pubKey.getEncodedDer("X509|UNCOMPRESSED");
          let ret: boolean = compareDataBlob(data1, data2);
          expect(ret).assertTrue();
          let data3: cryptoFramework.DataBlob = pubKey.getEncodedDer("X509|COMPRESSED");
          let data4: cryptoFramework.DataBlob = keyPair.pubKey.getEncodedDer("X509|COMPRESSED");
          ret = compareDataBlob(data3, data4);
          expect(ret).assertTrue();
        } catch (error: BusinessError) {
          console.error(`[XTS] Func_1900 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_PriKeyToPubKey_Func_2000
     * @tc.number SUB_Security_CryptoFramework_PriKeyToPubKey_Func_2000
     * @tc.desc   generateKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_PriKeyToPubKey_Func_2000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "RSA3072";
          let priKeyBlob: cryptoFramework.DataBlob = {data: new Uint8Array(RSA_3072_PRIVATE_KEY_DER)};
          let pubKeyBlob: cryptoFramework.DataBlob = {data: new Uint8Array(RSA_3072_PUBLIC_KEY_DER)};
          let keyPair: cryptoFramework.KeyPair = await convertKeyPair(algName, priKeyBlob, pubKeyBlob);
          let pubKey: cryptoFramework.PubKey = await getPubKey(keyPair.priKey);
          let data1: string = pubKey.getEncodedPem("PKCS1");
          let data2: string = keyPair.pubKey.getEncodedPem("PKCS1");
          let ret: boolean = compareString(data1, data2);
          expect(ret).assertTrue();
          let data3: string = pubKey.getEncodedPem("X509");
          let data4: string = keyPair.pubKey.getEncodedPem("X509");
          ret = compareString(data3, data4);
          expect(ret).assertTrue();
        } catch (error: BusinessError) {
          console.error(`[XTS] Func_2000 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_PriKeyToPubKey_Func_2100
     * @tc.number SUB_Security_CryptoFramework_PriKeyToPubKey_Func_2100
     * @tc.desc   generateKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_PriKeyToPubKey_Func_2100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "RSA3072";
          let priKeyBlob: cryptoFramework.DataBlob = {data: new Uint8Array(RSA_3072_PRIVATE_KEY_DER)};
          let keyPair: cryptoFramework.KeyPair = await convertKeyPair(algName, priKeyBlob, null);
          let pubKey: cryptoFramework.PubKey = await getPubKey(keyPair.priKey);
          let data: cryptoFramework.DataBlob = pubKey.getEncoded();
          algName = pubKey.algName;
          let format: string = pubKey.format;
          expect(algName).assertEqual("OPENSSL.RSA");
          expect(format).assertEqual("X.509");
          let ret: boolean = compareUint8Array(data.data, new Uint8Array(RSA_3072_PUBLIC_ENCODED));
          expect(ret).assertTrue();
        } catch (error: BusinessError) {
          console.error(`[XTS] Func_2100 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_PriKeyToPubKey_Func_2200
     * @tc.number SUB_Security_CryptoFramework_PriKeyToPubKey_Func_2200
     * @tc.desc   convertKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_PriKeyToPubKey_Func_2200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "SM2_256";
          let priKeyBlob: cryptoFramework.DataBlob = {data: new Uint8Array(SM2_PRIVATE_KEY_DER)};
          let pubKeyBlob: cryptoFramework.DataBlob = {data: new Uint8Array(SM2_PUBLIC_KEY_DER)};
          let keyPair: cryptoFramework.KeyPair = await convertKeyPair(algName, priKeyBlob, pubKeyBlob);
          let pubKey: cryptoFramework.PubKey = await getPubKey(keyPair.priKey);
          let data1: cryptoFramework.DataBlob = pubKey.getEncoded();
          let data2: cryptoFramework.DataBlob = keyPair.pubKey.getEncoded();
          let ret: boolean = compareDataBlob(data1, data2);
          expect(ret).assertTrue();
        } catch (error: BusinessError) {
          console.error(`[XTS] Func_2200 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_PriKeyToPubKey_Func_2300
     * @tc.number SUB_Security_CryptoFramework_PriKeyToPubKey_Func_2300
     * @tc.desc   specByKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_PriKeyToPubKey_Func_2300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "X25519";
          let spec: cryptoFramework.X25519PriKeySpec = {
            algName: "X25519",
            specType: cryptoFramework.AsyKeySpecType.PRIVATE_KEY_SPEC,
            sk: BigInt('80492519743984536410287031417673280832731199941643693694014394451502905215291')
          };
          let generator: cryptoFramework.AsyKeyGeneratorBySpec = cryptoFramework.createAsyKeyGeneratorBySpec(spec);
          let priKey: cryptoFramework.PriKey = await generator.generatePriKey();
          /* 通过keyPair里的私钥对象获取公钥 */
          let pubKey: cryptoFramework.PubKey = await getPubKey(priKey);
          /* 生成密钥对用于密钥协商 */
          let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
          let keyPair: cryptoFramework.KeyPair = await gen.generateKeyPair();
          /* 密钥协商 */
          let secret1: cryptoFramework.DataBlob = await doKeyAgreement(algName, keyPair.priKey, pubKey);
          let secret2: cryptoFramework.DataBlob = await doKeyAgreement(algName, priKey, keyPair.pubKey);
          /* 一致性对比 */
          let ret: boolean = compareDataBlob(secret1, secret2);
          expect(ret).assertTrue();
          /* 销毁私钥 */
          keyPair.priKey.clearMem();
          priKey.clearMem();
        } catch (error: BusinessError) {
          console.error(`[XTS] Func_2300 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_PriKeyToPubKey_Func_2400
     * @tc.number SUB_Security_CryptoFramework_PriKeyToPubKey_Func_2400
     * @tc.desc   specByKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_PriKeyToPubKey_Func_2400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "X25519";
          let spec: cryptoFramework.X25519KeyPairSpec = {
            algName: "X25519",
            specType: cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC,
            sk: BigInt('80492519743984536410287031417673280832731199941643693694014394451502905215291'),
            pk: BigInt('29236918585986399753398384668566812412856019336455282363269457131759906074454')
          };
          let generator: cryptoFramework.AsyKeyGeneratorBySpec = cryptoFramework.createAsyKeyGeneratorBySpec(spec);
          let keyPair1: cryptoFramework.KeyPair = generator.generateKeyPairSync();
          /* 通过keyPair里的私钥对象获取公钥 */
          let pubKey: cryptoFramework.PubKey = await getPubKey(keyPair1.priKey);
          /* 生成密钥对用于密钥协商 */
          let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
          let keyPair2: cryptoFramework.KeyPair = await gen.generateKeyPair();
          /* 密钥协商 */
          let secret1: cryptoFramework.DataBlob = await doKeyAgreement(algName, keyPair2.priKey, pubKey);
          let secret2: cryptoFramework.DataBlob = await doKeyAgreement(algName, keyPair1.priKey, keyPair2.pubKey);
          /* 一致性对比 */
          let ret: boolean = compareDataBlob(secret1, secret2);
          expect(ret).assertTrue();
          /* 销毁私钥 */
          keyPair2.priKey.clearMem();
          keyPair1.priKey.clearMem();
        } catch (error: BusinessError) {
          console.error(`[XTS] Func_2400 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });


  });
}

