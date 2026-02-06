/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { beforeAll, describe, expect, it, TestType, Level, Size } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityAccessCtrl, { Permissions } from '@ohos.abilityAccessCtrl';
import { Driver, ON } from '@ohos.UiTest';
import bundleManager from '@ohos.bundle.bundleManager';
import Want from '@ohos.app.ability.Want';
import contact from '@ohos.contact';
import cryptoFramework from '@ohos.security.cryptoFramework';
import buffer from '@ohos.buffer';
import huks from '@ohos.security.huks';
import fs from '@ohos.file.fs';
import SecurityUtils from './SecurityUtils'
import AbilityUtils from './AbilityUtils';
import PermissionUtils from './PermissionUtils';
import securityLabel from '@ohos.file.securityLabel';
import distributedKVStore from '@ohos.data.distributedKVStore';
import camera from '@ohos.multimedia.camera';
import appManager from '@ohos.app.ability.appManager';
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const delegator : AbilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

async function isInstalled() {
  let isInstall = true;
  try {
    let result = await delegator.executeShellCommand(`bm dump -a | grep com.ohos.contacts`);
    console.error(`UiTestCase, bm dump success,: ${ JSON.stringify( result )}`)
    if (!result.stdResult || result.stdResult == '') {
      isInstall = false;
    } else {
      isInstall = true;
    }
  } catch (error) {
    console.error(`UiTestCase, bm dump Failed: ${ JSON.stringify(error)}`)
    isInstall = false;
  }
  return isInstall;
}

export default function securityTest() {
  describe('SecurityTest', () => {
    let abilityContext: common.UIAbilityContext
    let applicationContext: common.ApplicationContext
    beforeAll(async (done: Function) => {
      abilityContext = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext
      applicationContext = abilityContext.getApplicationContext()
      expect(await AbilityUtils.startAbility('com.acts.pcs.arktstest', 'TestAbility', abilityContext)).assertTrue()
      let driver = Driver.create()
      await driver.delayMs(2000)
      done()
    })

    /*
     * @tc.number: STD-SECURITY-0101
     * @tc.name: testPermissionUserGrant0100
     * @tc.desc: 【STD-SECURITY-0101】必须为用户提供专用的界面或接口用于授权和管理动态权限(user_grant)，必要时用户可以撤销授权。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testPermissionUserGrant0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if(!canIUse("SystemCapability.Multimedia.Camera.Core")) {
        done()
        return
      }
      let permissions: Array<Permissions> = ['ohos.permission.CAMERA']
      await PermissionUtils.getPermission(abilityContext, permissions)
      await PermissionUtils.grantPermission()
      let driver = Driver.create();
      await driver.delayMs(1000)
      let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      let bundleFlag = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION
      let applicationInfo = await bundleManager.getBundleInfoForSelf(bundleFlag)
      let tokenId = applicationInfo.appInfo.accessTokenId
      let grantStatus = atManager.verifyAccessTokenSync(tokenId, 'ohos.permission.CAMERA')
      expect(grantStatus).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED)
      done()
    })

    /*
     * @tc.number: STD-SECURITY-0105
     * @tc.name: testBackgroundCameraBanned0100
     * @tc.desc: 【STD-SECURITY-0105】禁止允许应用在后台时使用相机权限。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testBackgroundCameraBanned0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if(!canIUse("SystemCapability.Multimedia.Camera.Core")) {
        done()
        return
      }
      expect(await AbilityUtils.startAbility('com.acts.pcs.arktstest', 'TestAbility', abilityContext)).assertTrue()
      if(camera.getCameraManager(applicationContext).getSupportedCameras().length == 0) {
        console.log(`No Supported usb camera`)
        done()
        return
      }
      let driver = Driver.create()
      await driver.delayMs(1000)
      let permissions: Array<Permissions> = ['ohos.permission.CAMERA']
      await PermissionUtils.getPermission(abilityContext, permissions)
      await PermissionUtils.grantPermission()
      await driver.delayMs(1000)
      let testAssistWantInfo: Want = {
        uri: 'http://assist.arkts.pcs.acts.com',
        type: "pcs/test"
      }
      expect(await AbilityUtils.startAbilityImplicitly(testAssistWantInfo, abilityContext)).assertTrue()
      await driver.delayMs(2000)
      let openButton = await driver.findComponent(ON.text('打开').inWindow('com.acts.pcs.arktstest'))
      if(openButton != undefined) {
        await openButton.click()
        await driver.delayMs(2000)
      }
      let allowButton1 = await driver.findComponent(ON.text('允许'))
      if(allowButton1 != undefined && allowButton1 != null) {
        await allowButton1.click()
        await driver.delayMs(2000)
      }
      let allowButton2 = await driver.findComponent(ON.text('本次允许'))
      if(allowButton2 != undefined && allowButton2 != null) {
        await allowButton2.click()
        await driver.delayMs(2000)
      }
      let processInformations = await applicationContext.getRunningProcessInformation()
      let processInformation = processInformations[0]
      if (processInformation.state != appManager.ProcessState.STATE_BACKGROUND) {
        console.log(`The device do not have state STATE_BACKGROUND.`)
        done()
        return
      }
      let cameraManager = camera.getCameraManager(applicationContext)
      let supportedCameras = cameraManager.getSupportedCameras()
      expect(supportedCameras.length).assertLarger(0)
      await driver.delayMs(3000)
      let cameraDevice = supportedCameras[0]
      let cameraInput: camera.CameraInput | undefined = undefined
      try {
        cameraInput = cameraManager.createCameraInput(cameraDevice)
        expect(cameraInput == undefined).assertTrue()
      } catch (error) {
        let err = error as BusinessError;
        console.info(`Failed to use camera api background. error: ${JSON.stringify(err)}`)
        expect(err.code).assertEqual("7400201")
      }
      done()
    })

    /*
     * @tc.number: STD-SECURITY-0106
     * @tc.name: testAuthenticationCall0100
     * @tc.desc: 【STD-SECURITY-0106】涉及权限保护的接口，必须通过鉴权之后才允许被调用。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testAuthenticationCall0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`testAuthenticationCall0100 start`)
      expect(await AbilityUtils.startAbility('com.acts.pcs.arktstest', 'TestAbility', abilityContext)).assertTrue()
      let contacts = canIUse("SystemCapability.Applications.Contacts");
      console.info(`testAuthenticationCall0100 contacts,${ contacts }`);
      const isInstall = await isInstalled();
      console.info(`testAuthenticationCall0100 isInstall,${ isInstall }`);
      if (contacts && isInstall) {
        let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
        let bundleFlag = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION
        let applicationInfo = await bundleManager.getBundleInfoForSelf(bundleFlag)
        let tokenId = applicationInfo.appInfo.accessTokenId
        let contactInfo: contact.Contact = {
          name: {fullName: 'pcstest'},
          phoneNumbers: [{phoneNumber: '10000000000'}]
        }
        let grantStatus = atManager.verifyAccessTokenSync(tokenId, 'ohos.permission.WRITE_CONTACTS')
        console.info(`testAuthenticationCall0100 grantStatus,${ grantStatus }`);
        expect(grantStatus).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_DENIED)
        try {
          let id = await contact.addContact(abilityContext, contactInfo)
          expect(false).assertTrue()
        } catch (error) {
          let err = error as BusinessError;
          console.info(`Failed to add contact. error: ${JSON.stringify(err)}`)
          expect(err.code == 201).assertTrue()
        }
        let permissions: Array<Permissions> = ['ohos.permission.WRITE_CONTACTS']
        await PermissionUtils.getPermission(abilityContext, permissions)
        await PermissionUtils.grantPermission()
        let driver = Driver.create();
        await driver.delayMs(1000)
        grantStatus = atManager.verifyAccessTokenSync(tokenId, 'ohos.permission.WRITE_CONTACTS')
        console.info(`testAuthenticationCall0100 grantStatus again,${ grantStatus }`);
        expect(grantStatus).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED)
        try {
          let id = await contact.addContact(abilityContext, contactInfo)
          expect(id != undefined).assertTrue()
        } catch (error) {
          let err = error as BusinessError;
          console.info(`Failed to add contact again. error: ${JSON.stringify(err)}`)
          expect(err.code != 201).assertTrue()
        }
      }
      console.info(`testAuthenticationCall0100 end`)
      done()
    })

    /*
     * @tc.number: C-ALL-SECURITY-0300
     * @tc.name: testHardwareSupportAESGCM256Alg0100
     * @tc.desc: 【C-ALL-SECURITY-0300】必须至少支持 AES-GCM-256 算法，用于报文传输的加密和解密。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testHardwareSupportAESGCM256Alg0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let keyData = new Uint8Array(buffer.from('12345678abcdefgh12345678abcdefgh', 'utf8').buffer)
        let symKey = await SecurityUtils.genSymKeyByData(keyData, 'AES256')

        let message = "This is a AES-GCM-256 test"
        let plainText: cryptoFramework.DataBlob = {
          data: new Uint8Array(buffer.from(message, 'utf-8').buffer)
        }
        let gcmParams = SecurityUtils.genGcmParamsSpec()

        let encryptText =
          await SecurityUtils.encryptMessageByAESGCMPromise('AES256|GCM|PKCS7', symKey, plainText, gcmParams)
        let decryptText =
          await SecurityUtils.decryptMessageByAESGCMPromise('AES256|GCM|PKCS7', symKey, encryptText, gcmParams)
        expect(decryptText.data.toString()).assertEqual(plainText.data.toString())
      } catch (error) {
        let err = error as BusinessError
        console.error(`Failed to use AES-GCM-256 for encryption and decryption. error: ${JSON.stringify(err)}`)
        expect(false).assertEqual(true)
      }
      done()
    })

    /*
     * @tc.number: C-ALL-SECURITY-0302
     * @tc.name: testSupportHASHAndHMACAlg0100
     * @tc.desc: 【C-ALL-SECURITY-0302】必须支持硬件 HASH-SHA256、HMAC_SHA256 算法。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSupportHASHAndHMACAlg0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let mdAlgName = 'SHA256'
        let message = 'This is a HASH_SHA256 test'
        let md = cryptoFramework.createMd(mdAlgName);
        await md.update({
          data: new Uint8Array(buffer.from(message, 'utf-8').buffer)
        });
        let mdResult = await md.digest();
        expect(mdResult.data != null).assertTrue()
        expect(md.getMdLength()).assertEqual(32)
      } catch (error) {
        let err = error as BusinessError;
        console.error(`Failed to use HASH_SHA256 for message digest. error: ${JSON.stringify(err)}`)
        expect(false).assertEqual(true)
      }
      try {
        let keyData = new Uint8Array(buffer.from('12345678abcdefgh12345678abcdefgh', 'utf8').buffer)
        let symKey = await SecurityUtils.genSymKeyByData(keyData, 'AES256')
        let macAlgName = 'SHA256'
        let message = 'This is a HMAC_SHA256 test'
        let mac = cryptoFramework.createMac(macAlgName)
        await mac.init(symKey)
        await mac.update({
          data: new Uint8Array(buffer.from(message, 'utf-8').buffer)
        })
        let macResult = await mac.doFinal()
        expect(macResult.data != null).assertTrue()
        expect(mac.getMacLength()).assertEqual(32)
      } catch (error) {
        let err = error as BusinessError;
        console.error(`Failed to use HMAC_SHA256 for MAC. error: ${JSON.stringify(err)}`)
        expect(false).assertEqual(true)
      }
      done()
    })

    /*
     * @tc.number: C-ALL-SECURITY-0303
     * @tc.name: testSupportRSA2048Alg0100
     * @tc.desc: 【C-ALL-SECURITY-0303】必须支持硬件 RSA、ECC 签名校验算法。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSupportRSA2048Alg0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let keyGenAlg = "RSA2048"
        let generator = cryptoFramework.createAsyKeyGenerator(keyGenAlg)
        let keyPair = await generator.generateKeyPair()
        let signAlg = "RSA2048|PKCS1|SHA256"
        let input: cryptoFramework.DataBlob = {
          data: new Uint8Array(buffer.from("This is a RSA2048 test", 'utf8').buffer)
        };
        let signData = await SecurityUtils.signMessagePromise(signAlg, input, keyPair.priKey)
        let verifyResult = await SecurityUtils.verifyMessagePromise(signAlg, input, signData, keyPair.pubKey)
        expect(verifyResult).assertTrue()
      } catch (error) {
        let err = error as BusinessError
        console.error(`Failed to use RSA2048 for sign and verify. error: ${JSON.stringify(err)}`)
        expect(false).assertEqual(true)
      }
      done()
    })

    /*
     * @tc.number: C-ALL-SECURITY-0303
     * @tc.name: testSupportECCAlg0100
     * @tc.desc: 【C-ALL-SECURITY-0303】必须支持硬件 RSA、ECC 签名校验算法。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSupportECCAlg0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let keyGenAlg = "ECC256"
        let generator = cryptoFramework.createAsyKeyGenerator(keyGenAlg)
        let keyPair = await generator.generateKeyPair()
        let signAlg = "ECC256|SHA256"
        let input: cryptoFramework.DataBlob = {
          data: new Uint8Array(buffer.from("This is a ECC256 test", 'utf8').buffer)
        };
        let signData = await SecurityUtils.signMessagePromise(signAlg, input, keyPair.priKey)
        let verifyResult = await SecurityUtils.verifyMessagePromise(signAlg, input, signData, keyPair.pubKey)
        expect(verifyResult).assertTrue()
      } catch (error) {
        let err = error as BusinessError
        console.error(`Failed to use ECC for sign and verify. error: ${JSON.stringify(err)}`)
        expect(false).assertEqual(true)
      }
      done()
    })

    /*
     * @tc.number: G-SECURITY-0308
     * @tc.name: testSupportSecureRandomNumber0100
     * @tc.desc: 【G-SECURITY-0308】必须支持安全随机数。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSupportSecureRandomNumber0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let rand = cryptoFramework.createRandom();
        let seed = new Uint8Array([1, 2, 3]);
        rand.setSeed({
          data: seed
        });
        let len = 12;
        let randOutput = await rand.generateRandom(len);
        expect(randOutput != undefined).assertTrue()
        expect(randOutput.data.length).assertEqual(12)
      } catch (error) {
        let err = error as BusinessError
        console.error(`Failed to generate secure random number. error: ${JSON.stringify(err)}`)
        expect(false).assertEqual(true)
      }
      done()
    })

    /*
     * @tc.number: G-SECURITY-0309
     * @tc.name: testSupportHASHSHA256Alg0100
     * @tc.desc: 【G-SECURITY-0309】必须支持 HASH 算法，至少包括 SHA256。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSupportHASHSHA256Alg0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let mdAlgName = 'SHA256'
        let message = 'This is a HASH_SHA256 test'
        let md = cryptoFramework.createMd(mdAlgName);
        await md.update({
          data: new Uint8Array(buffer.from(message, 'utf-8').buffer)
        });
        let mdResult = await md.digest();
        expect(mdResult.data != null).assertTrue()
        expect(md.getMdLength()).assertEqual(32)
      } catch (error) {
        let err = error as BusinessError;
        console.error(`Failed to use HASH_SHA256 for message digest. error: ${JSON.stringify(err)}`)
        expect(false).assertEqual(true)
      }
      done()
    })

    /*
     * @tc.number: S|STD-SECURITY-0310
     * @tc.name: testSupportHKDFAlg0100
     * @tc.desc: 【S|STD-SECURITY-0310】必须支持 HMAC 和 HKDF 算法，至少包括 HMAC-SHA256。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSupportHKDFAlg0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let keyAlias = 'hkdf_key'
      let HuksKeyDeriveKeySize = 32
      let deriveHkdfInData = "deriveHkdfTestIndata"
      // generate key item
      try {
        let generateRes: [boolean, huks.HuksOptions] = await SecurityUtils.generateKeyItem(keyAlias,
          huks.HuksKeyStorageType.HUKS_STORAGE_KEY_EXPORT_ALLOWED)
        let result = generateRes[0]
        let huksOptions = generateRes[1]
        expect(result).assertTrue()
        expect(await huks.isKeyItemExist(keyAlias, huksOptions)).assertTrue()
        // init session
        let initRes: [number, huks.HuksOptions] =
          await SecurityUtils.createSession(keyAlias, HuksKeyDeriveKeySize, deriveHkdfInData)
        let handle = initRes[0]
        let initOptions = initRes[1]
        expect(handle != -1).assertTrue()
        // update session
        expect(await SecurityUtils.updateSession(handle, initOptions))
        // finish session
        expect(await SecurityUtils.finishSession(keyAlias, handle))
        // delete key item
        expect(await SecurityUtils.deleteKeyItem(keyAlias, huksOptions))
      } catch (error) {
        let err = error as BusinessError
        console.error(`Failed to generate key item. error: ${JSON.stringify(err)}`)
        expect(false).assertEqual(true)
      }
      done()
    })

    /*
     * @tc.number: G-SECURITY-0311
     * @tc.name: testSupportAESCBC128Alg0100
     * @tc.desc: 【G-SECURITY-0311】必须支持 AES 对称加密算法，分组模式支持 CBC、GCM，密钥长度支持 128、192、256 位。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSupportAESCBC128Alg0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let keyData1 = new Uint8Array(buffer.from('12345678abcdefgh', 'utf8').buffer)
        let symKey1 = await SecurityUtils.genSymKeyByData(keyData1, 'AES128')
        let message1 = "This is a AES-CBC-128 test"
        let plainText1: cryptoFramework.DataBlob = {
          data: new Uint8Array(buffer.from(message1, 'utf-8').buffer)
        }
        let ivParams = SecurityUtils.genIvParamsSpec()
        let encryptText1 =
          await SecurityUtils.encryptMessagePromise('AES128|CBC|PKCS7', symKey1, plainText1, ivParams)
        let decryptText1 =
          await SecurityUtils.decryptMessagePromise('AES128|CBC|PKCS7', symKey1, encryptText1, ivParams)
        expect(decryptText1.data.toString()).assertEqual(plainText1.data.toString())
      } catch (error) {
        let err = error as BusinessError
        console.error(`Failed to use AES-CBC-128 for encryption and decryption. error: ${JSON.stringify(err)}`)
        expect(false).assertEqual(true)
      }
      done()
    })

    /*
     * @tc.number: G-SECURITY-0311
     * @tc.name: testSupportAESCBC192Alg0100
     * @tc.desc: 【G-SECURITY-0311】必须支持 AES 对称加密算法，分组模式支持 CBC、GCM，密钥长度支持 128、192、256 位。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSupportAESCBC192Alg0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let keyData2 = new Uint8Array(buffer.from('12345678abcdefgh12345678', 'utf8').buffer)
        let symKey2 = await SecurityUtils.genSymKeyByData(keyData2, 'AES192')
        let message2 = "This is a AES-CBC-192 test"
        let plainText2: cryptoFramework.DataBlob = {
          data: new Uint8Array(buffer.from(message2, 'utf-8').buffer)
        }
        let ivParams = SecurityUtils.genIvParamsSpec()
        let encryptText2 =
          await SecurityUtils.encryptMessagePromise('AES192|CBC|PKCS7', symKey2, plainText2, ivParams)
        let decryptText2 =
          await SecurityUtils.decryptMessagePromise('AES192|CBC|PKCS7', symKey2, encryptText2, ivParams)
        expect(decryptText2.data.toString()).assertEqual(plainText2.data.toString())
      } catch (error) {
        let err = error as BusinessError
        console.error(`Failed to use AES-CBC-192 for encryption and decryption. error: ${JSON.stringify(err)}`)
        expect(false).assertEqual(true)
      }
      done()
    })

    /*
     * @tc.number: G-SECURITY-0311
     * @tc.name: testSupportAESCBC256Alg0100
     * @tc.desc: 【G-SECURITY-0311】必须支持 AES 对称加密算法，分组模式支持 CBC、GCM，密钥长度支持 128、192、256 位。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSupportAESCBC256Alg0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let keyData3 = new Uint8Array(buffer.from('12345678abcdefgh12345678abcdefgh', 'utf8').buffer)
        let symKey3 = await SecurityUtils.genSymKeyByData(keyData3, 'AES256')
        let message3 = "This is a AES-CBC-256 test"
        let plainText3: cryptoFramework.DataBlob = {
          data: new Uint8Array(buffer.from(message3, 'utf-8').buffer)
        }
        let ivParams = SecurityUtils.genIvParamsSpec()
        let encryptText3 =
          await SecurityUtils.encryptMessagePromise('AES256|CBC|PKCS7', symKey3, plainText3, ivParams)
        let decryptText3 =
          await SecurityUtils.decryptMessagePromise('AES256|CBC|PKCS7', symKey3, encryptText3, ivParams)
        expect(decryptText3.data.toString()).assertEqual(plainText3.data.toString())
      } catch (error) {
        let err = error as BusinessError
        console.error(`Failed to use AES-CBC-256 for encryption and decryption. error: ${JSON.stringify(err)}`)
        expect(false).assertEqual(true)
      }
      done()
    })

    /*
     * @tc.number: G-SECURITY-0311
     * @tc.name: testSupportAESGCM128Alg0100
     * @tc.desc: 【G-SECURITY-0311】必须支持 AES 对称加密算法，分组模式支持 CBC、GCM，密钥长度支持 128、192、256 位。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSupportAESGCM128Alg0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let keyData1 = new Uint8Array(buffer.from('12345678abcdefgh', 'utf8').buffer)
        let symKey1 = await SecurityUtils.genSymKeyByData(keyData1, 'AES128')
        let message1 = "This is a AES-GCM-128 test"
        let plainText1: cryptoFramework.DataBlob = {
          data: new Uint8Array(buffer.from(message1, 'utf-8').buffer)
        }
        let gcmParams = SecurityUtils.genGcmParamsSpec()
        let encryptText1 =
          await SecurityUtils.encryptMessageByAESGCMPromise('AES128|GCM|PKCS7', symKey1, plainText1, gcmParams)
        let decryptText1 =
          await SecurityUtils.decryptMessageByAESGCMPromise('AES128|GCM|PKCS7', symKey1, encryptText1, gcmParams)
        expect(decryptText1.data.toString()).assertEqual(plainText1.data.toString())
      } catch (error) {
        let err = error as BusinessError
        console.error(`Failed to use AES-GCM-128 for encryption and decryption. error: ${JSON.stringify(err)}`)
        expect(false).assertEqual(true)
      }
      done()
    })

    /*
      * @tc.number: G-SECURITY-0311
      * @tc.name: testSupportAESGCM192Alg0100
      * @tc.desc: 【G-SECURITY-0311】必须支持 AES 对称加密算法，分组模式支持 CBC、GCM，密钥长度支持 128、192、256 位。
      * @tc.size: MediumTest
      * @tc.type: Function
      * @tc.level: Level 0
      */
    it('testSupportAESGCM192Alg0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let keyData2 = new Uint8Array(buffer.from('12345678abcdefgh12345678', 'utf8').buffer)
        let symKey2 = await SecurityUtils.genSymKeyByData(keyData2, 'AES192')
        let message2 = "This is a AES-GCM-192 test"
        let plainText2: cryptoFramework.DataBlob = {
          data: new Uint8Array(buffer.from(message2, 'utf-8').buffer)
        }
        let gcmParams = SecurityUtils.genGcmParamsSpec()
        let encryptText2 =
          await SecurityUtils.encryptMessageByAESGCMPromise('AES192|GCM|PKCS7', symKey2, plainText2, gcmParams)
        let decryptText2 =
          await SecurityUtils.decryptMessageByAESGCMPromise('AES192|GCM|PKCS7', symKey2, encryptText2, gcmParams)
        expect(decryptText2.data.toString()).assertEqual(plainText2.data.toString())
      } catch (error) {
        let err = error as BusinessError
        console.error(`Failed to use AES-GCM-192 for encryption and decryption. error: ${JSON.stringify(err)}`)
        expect(false).assertEqual(true)
      }
      done()
    })

    /*
      * @tc.number: G-SECURITY-0311
      * @tc.name: testSupportAESGCM256Alg0100
      * @tc.desc: 【G-SECURITY-0311】必须支持 AES 对称加密算法，分组模式支持 CBC、GCM，密钥长度支持 128、192、256 位。
      * @tc.size: MediumTest
      * @tc.type: Function
      * @tc.level: Level 0
      */
    it('testSupportAESGCM256Alg0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let keyData3 = new Uint8Array(buffer.from('12345678abcdefgh12345678abcdefgh', 'utf8').buffer)
        let symKey3 = await SecurityUtils.genSymKeyByData(keyData3, 'AES256')
        let message3 = "This is a AES-GCM-256 test"
        let plainText3: cryptoFramework.DataBlob = {
          data: new Uint8Array(buffer.from(message3, 'utf-8').buffer)
        }
        let gcmParams = SecurityUtils.genGcmParamsSpec()
        let encryptText3 =
          await SecurityUtils.encryptMessageByAESGCMPromise('AES256|GCM|PKCS7', symKey3, plainText3, gcmParams)
        let decryptText3 =
          await SecurityUtils.decryptMessageByAESGCMPromise('AES256|GCM|PKCS7', symKey3, encryptText3, gcmParams)
        expect(decryptText3.data.toString()).assertEqual(plainText3.data.toString())
      } catch (error) {
        let err = error as BusinessError
        console.error(`Failed to use AES-GCM-256 for encryption and decryption. error: ${JSON.stringify(err)}`)
        expect(false).assertEqual(true)
      }
      done()
    })

    /*
     * @tc.number: S|STD-SECURITY-0312
     * @tc.name: testSupportAESECB128Alg0100
     * @tc.desc: 【S|STD-SECURITY-0312】必须支持 AES 对称加密算法，分组模式支持 ECB、OFB、CFB、CTR、CCM、
     *            密钥长度支持 128、192、256 位。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSupportAESECB128Alg0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let keyData1 = new Uint8Array(buffer.from('12345678abcdefgh', 'utf8').buffer)
        let symKey1 = await SecurityUtils.genSymKeyByData(keyData1, 'AES128')
        let message1 = "This is a AES-ECB-128 test"
        let plainText1: cryptoFramework.DataBlob = {
          data: new Uint8Array(buffer.from(message1, 'utf-8').buffer)
        }
        let encryptText1 =
          await SecurityUtils.encryptMessagePromise('AES128|ECB|PKCS7', symKey1, plainText1)
        let decryptText1 =
          await SecurityUtils.decryptMessagePromise('AES128|ECB|PKCS7', symKey1, encryptText1)
        expect(decryptText1.data.toString()).assertEqual(plainText1.data.toString())
      } catch (error) {
        let err = error as BusinessError
        console.error(`Failed to use AES-ECB-128 for encryption and decryption. error: ${JSON.stringify(err)}`)
        expect(false).assertEqual(true)
      }
      done()
    })

    /*
     * @tc.number: S|STD-SECURITY-0312
     * @tc.name: testSupportAESECB192Alg0100
     * @tc.desc: 【S|STD-SECURITY-0312】必须支持 AES 对称加密算法，分组模式支持 ECB、OFB、CFB、CTR、CCM、
     *            密钥长度支持 128、192、256 位。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSupportAESECB192Alg0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let keyData2 = new Uint8Array(buffer.from('12345678abcdefgh12345678', 'utf8').buffer)
        let symKey2 = await SecurityUtils.genSymKeyByData(keyData2, 'AES192')
        let message2 = "This is a AES-ECB-192 test"
        let plainText2: cryptoFramework.DataBlob = {
          data: new Uint8Array(buffer.from(message2, 'utf-8').buffer)
        }
        let encryptText2 =
          await SecurityUtils.encryptMessagePromise('AES192|ECB|PKCS7', symKey2, plainText2)
        let decryptText2 =
          await SecurityUtils.decryptMessagePromise('AES192|ECB|PKCS7', symKey2, encryptText2)
        expect(decryptText2.data.toString()).assertEqual(plainText2.data.toString())
      } catch (error) {
        let err = error as BusinessError
        console.error(`Failed to use AES-ECB-192 for encryption and decryption. error: ${JSON.stringify(err)}`)
        expect(false).assertEqual(true)
      }
      done()
    })

    /*
     * @tc.number: S|STD-SECURITY-0312
     * @tc.name: testSupportAESECB256Alg0100
     * @tc.desc: 【S|STD-SECURITY-0312】必须支持 AES 对称加密算法，分组模式支持 ECB、OFB、CFB、CTR、CCM、
     *            密钥长度支持 128、192、256 位。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSupportAESECB256Alg0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let keyData3 = new Uint8Array(buffer.from('12345678abcdefgh12345678abcdefgh', 'utf8').buffer)
        let symKey3 = await SecurityUtils.genSymKeyByData(keyData3, 'AES256')
        let message3 = "This is a AES-ECB-256 test"
        let plainText3: cryptoFramework.DataBlob = {
          data: new Uint8Array(buffer.from(message3, 'utf-8').buffer)
        }
        let encryptText3 =
          await SecurityUtils.encryptMessagePromise('AES256|ECB|PKCS7', symKey3, plainText3)
        let decryptText3 =
          await SecurityUtils.decryptMessagePromise('AES256|ECB|PKCS7', symKey3, encryptText3)
        expect(decryptText3.data.toString()).assertEqual(plainText3.data.toString())
      } catch (error) {
        let err = error as BusinessError
        console.error(`Failed to use AES-ECB-256 for encryption and decryption. error: ${JSON.stringify(err)}`)
        expect(false).assertEqual(true)
      }
      done()
    })

    /*
     * @tc.number: S|STD-SECURITY-0312
     * @tc.name: testSupportAESOFB128Alg0100
     * @tc.desc: 【S|STD-SECURITY-0312】必须支持 AES 对称加密算法，分组模式支持 ECB、OFB、CFB、CTR、CCM、
     *            密钥长度支持 128、192、256 位。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSupportAESOFB128Alg0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let keyData1 = new Uint8Array(buffer.from('12345678abcdefgh', 'utf8').buffer)
        let symKey1 = await SecurityUtils.genSymKeyByData(keyData1, 'AES128')
        let message1 = "This is a AES-OFB-128 test"
        let plainText1: cryptoFramework.DataBlob = {
          data: new Uint8Array(buffer.from(message1, 'utf-8').buffer)
        }
        let ivParams = SecurityUtils.genIvParamsSpec()
        let encryptText1 =
          await SecurityUtils.encryptMessagePromise('AES128|OFB|PKCS7', symKey1, plainText1, ivParams)
        let decryptText1 =
          await SecurityUtils.decryptMessagePromise('AES128|OFB|PKCS7', symKey1, encryptText1, ivParams)
        expect(decryptText1.data.toString()).assertEqual(plainText1.data.toString())
      } catch (error) {
        let err = error as BusinessError
        console.error(`Failed to use AES-OFB-128 for encryption and decryption. error: ${JSON.stringify(err)}`)
        expect(false).assertEqual(true)
      }
      done()
    })

    /*
     * @tc.number: S|STD-SECURITY-0312
     * @tc.name: testSupportAESOFB192Alg0100
     * @tc.desc: 【S|STD-SECURITY-0312】必须支持 AES 对称加密算法，分组模式支持 ECB、OFB、CFB、CTR、CCM、
     *            密钥长度支持 128、192、256 位。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSupportAESOFB192Alg0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let keyData2 = new Uint8Array(buffer.from('12345678abcdefgh12345678', 'utf8').buffer)
        let symKey2 = await SecurityUtils.genSymKeyByData(keyData2, 'AES192')
        let message2 = "This is a AES-OFB-192 test"
        let plainText2: cryptoFramework.DataBlob = {
          data: new Uint8Array(buffer.from(message2, 'utf-8').buffer)
        }
        let ivParams = SecurityUtils.genIvParamsSpec()
        let encryptText2 =
          await SecurityUtils.encryptMessagePromise('AES192|OFB|PKCS7', symKey2, plainText2, ivParams)
        let decryptText2 =
          await SecurityUtils.decryptMessagePromise('AES192|OFB|PKCS7', symKey2, encryptText2, ivParams)
        expect(decryptText2.data.toString()).assertEqual(plainText2.data.toString())
      } catch (error) {
        let err = error as BusinessError
        console.error(`Failed to use AES-OFB-192 for encryption and decryption. error: ${JSON.stringify(err)}`)
        expect(false).assertEqual(true)
      }
      done()
    })

    /*
     * @tc.number: S|STD-SECURITY-0312
     * @tc.name: testSupportAESOFB256Alg0100
     * @tc.desc: 【S|STD-SECURITY-0312】必须支持 AES 对称加密算法，分组模式支持 ECB、OFB、CFB、CTR、CCM、
     *            密钥长度支持 128、192、256 位。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSupportAESOFB256Alg0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let keyData3 = new Uint8Array(buffer.from('12345678abcdefgh12345678abcdefgh', 'utf8').buffer)
        let symKey3 = await SecurityUtils.genSymKeyByData(keyData3, 'AES256')
        let message3 = "This is a AES-OFB-256 test"
        let plainText3: cryptoFramework.DataBlob = {
          data: new Uint8Array(buffer.from(message3, 'utf-8').buffer)
        }
        let ivParams = SecurityUtils.genIvParamsSpec()
        let encryptText3 =
          await SecurityUtils.encryptMessagePromise('AES256|OFB|PKCS7', symKey3, plainText3, ivParams)
        let decryptText3 =
          await SecurityUtils.decryptMessagePromise('AES256|OFB|PKCS7', symKey3, encryptText3, ivParams)
        expect(decryptText3.data.toString()).assertEqual(plainText3.data.toString())
      } catch (error) {
        let err = error as BusinessError
        console.error(`Failed to use AES-OFB-256 for encryption and decryption. error: ${JSON.stringify(err)}`)
        expect(false).assertEqual(true)
      }
      done()
    })

    /*
     * @tc.number: S|STD-SECURITY-0312
     * @tc.name: testSupportAESCFB128Alg0100
     * @tc.desc: 【S|STD-SECURITY-0312】必须支持 AES 对称加密算法，分组模式支持 ECB、OFB、CFB、CTR、CCM、
     *            密钥长度支持 128、192、256 位。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSupportAESCFB128Alg0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let keyData1 = new Uint8Array(buffer.from('12345678abcdefgh', 'utf8').buffer)
        let symKey1 = await SecurityUtils.genSymKeyByData(keyData1, 'AES128')
        let message1 = "This is a AES-CFB-128 test"
        let plainText1: cryptoFramework.DataBlob = {
          data: new Uint8Array(buffer.from(message1, 'utf-8').buffer)
        }
        let ivParams = SecurityUtils.genIvParamsSpec()
        let encryptText1 =
          await SecurityUtils.encryptMessagePromise('AES128|CFB|PKCS7', symKey1, plainText1, ivParams)
        let decryptText1 =
          await SecurityUtils.decryptMessagePromise('AES128|CFB|PKCS7', symKey1, encryptText1, ivParams)
        expect(decryptText1.data.toString()).assertEqual(plainText1.data.toString())
      } catch (error) {
        let err = error as BusinessError
        console.error(`Failed to use AES-CFB-128 for encryption and decryption. error: ${JSON.stringify(err)}`)
        expect(false).assertEqual(true)
      }
      done()
    })

    /*
     * @tc.number: S|STD-SECURITY-0312
     * @tc.name: testSupportAESCFB192Alg0100
     * @tc.desc: 【S|STD-SECURITY-0312】必须支持 AES 对称加密算法，分组模式支持 ECB、OFB、CFB、CTR、CCM、
     *            密钥长度支持 128、192、256 位。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSupportAESCFB192Alg0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let keyData2 = new Uint8Array(buffer.from('12345678abcdefgh12345678', 'utf8').buffer)
        let symKey2 = await SecurityUtils.genSymKeyByData(keyData2, 'AES192')
        let message2 = "This is a AES-CFB-192 test"
        let plainText2: cryptoFramework.DataBlob = {
          data: new Uint8Array(buffer.from(message2, 'utf-8').buffer)
        }
        let ivParams = SecurityUtils.genIvParamsSpec()
        let encryptText2 =
          await SecurityUtils.encryptMessagePromise('AES192|CFB|PKCS7', symKey2, plainText2, ivParams)
        let decryptText2 =
          await SecurityUtils.decryptMessagePromise('AES192|CFB|PKCS7', symKey2, encryptText2, ivParams)
        expect(decryptText2.data.toString()).assertEqual(plainText2.data.toString())
      } catch (error) {
        let err = error as BusinessError
        console.error(`Failed to use AES-CFB-192 for encryption and decryption. error: ${JSON.stringify(err)}`)
        expect(false).assertEqual(true)
      }
      done()
    })

    /*
     * @tc.number: S|STD-SECURITY-0312
     * @tc.name: testSupportAESCFB256Alg0100
     * @tc.desc: 【S|STD-SECURITY-0312】必须支持 AES 对称加密算法，分组模式支持 ECB、OFB、CFB、CTR、CCM、
     *            密钥长度支持 128、192、256 位。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSupportAESCFB256Alg0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let keyData3 = new Uint8Array(buffer.from('12345678abcdefgh12345678abcdefgh', 'utf8').buffer)
        let symKey3 = await SecurityUtils.genSymKeyByData(keyData3, 'AES256')
        let message3 = "This is a AES-CFB-256 test"
        let plainText3: cryptoFramework.DataBlob = {
          data: new Uint8Array(buffer.from(message3, 'utf-8').buffer)
        }
        let ivParams = SecurityUtils.genIvParamsSpec()
        let encryptText3 =
          await SecurityUtils.encryptMessagePromise('AES256|CFB|PKCS7', symKey3, plainText3, ivParams)
        let decryptText3 =
          await SecurityUtils.decryptMessagePromise('AES256|CFB|PKCS7', symKey3, encryptText3, ivParams)
        expect(decryptText3.data.toString()).assertEqual(plainText3.data.toString())
      } catch (error) {
        let err = error as BusinessError
        console.error(`Failed to use AES-CFB-256 for encryption and decryption. error: ${JSON.stringify(err)}`)
        expect(false).assertEqual(true)
      }
      done()
    })

    /*
     * @tc.number: S|STD-SECURITY-0312
     * @tc.name: testSupportAESCTR128Alg0100
     * @tc.desc: 【S|STD-SECURITY-0312】必须支持 AES 对称加密算法，分组模式支持 ECB、OFB、CFB、CTR、CCM、
     *            密钥长度支持 128、192、256 位。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSupportAESCTR128Alg0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let keyData1 = new Uint8Array(buffer.from('12345678abcdefgh', 'utf8').buffer)
        let symKey1 = await SecurityUtils.genSymKeyByData(keyData1, 'AES128')
        let message1 = "This is a AES-CTR-128 test"
        let plainText1: cryptoFramework.DataBlob = {
          data: new Uint8Array(buffer.from(message1, 'utf-8').buffer)
        }
        let ivParams = SecurityUtils.genIvParamsSpec()
        let encryptText1 =
          await SecurityUtils.encryptMessagePromise('AES128|CTR|PKCS7', symKey1, plainText1, ivParams)
        let decryptText1 =
          await SecurityUtils.decryptMessagePromise('AES128|CTR|PKCS7', symKey1, encryptText1, ivParams)
        expect(decryptText1.data.toString()).assertEqual(plainText1.data.toString())
      } catch (error) {
        let err = error as BusinessError
        console.error(`Failed to use AES-CTR-128 for encryption and decryption. error: ${JSON.stringify(err)}`)
        expect(false).assertEqual(true)
      }
      done()
    })

    /*
     * @tc.number: S|STD-SECURITY-0312
     * @tc.name: testSupportAESCTR192Alg0100
     * @tc.desc: 【S|STD-SECURITY-0312】必须支持 AES 对称加密算法，分组模式支持 ECB、OFB、CFB、CTR、CCM、
     *            密钥长度支持 128、192、256 位。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSupportAESCTR192Alg0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let keyData2 = new Uint8Array(buffer.from('12345678abcdefgh12345678', 'utf8').buffer)
        let symKey2 = await SecurityUtils.genSymKeyByData(keyData2, 'AES192')
        let message2 = "This is a AES-CTR-192 test"
        let plainText2: cryptoFramework.DataBlob = {
          data: new Uint8Array(buffer.from(message2, 'utf-8').buffer)
        }
        let ivParams = SecurityUtils.genIvParamsSpec()
        let encryptText2 =
          await SecurityUtils.encryptMessagePromise('AES192|CTR|PKCS7', symKey2, plainText2, ivParams)
        let decryptText2 =
          await SecurityUtils.decryptMessagePromise('AES192|CTR|PKCS7', symKey2, encryptText2, ivParams)
        expect(decryptText2.data.toString()).assertEqual(plainText2.data.toString())
      } catch (error) {
        let err = error as BusinessError
        console.error(`Failed to use AES-CTR-192 for encryption and decryption. error: ${JSON.stringify(err)}`)
        expect(false).assertEqual(true)
      }
      done()
    })


    /*
     * @tc.number: S|STD-SECURITY-0312
     * @tc.name: testSupportAESCTR256Alg0100
     * @tc.desc: 【S|STD-SECURITY-0312】必须支持 AES 对称加密算法，分组模式支持 ECB、OFB、CFB、CTR、CCM、
     *            密钥长度支持 128、192、256 位。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSupportAESCTR256Alg0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let keyData3 = new Uint8Array(buffer.from('12345678abcdefgh12345678abcdefgh', 'utf8').buffer)
        let symKey3 = await SecurityUtils.genSymKeyByData(keyData3, 'AES256')
        let message3 = "This is a AES-CTR-256 test"
        let plainText3: cryptoFramework.DataBlob = {
          data: new Uint8Array(buffer.from(message3, 'utf-8').buffer)
        }
        let ivParams = SecurityUtils.genIvParamsSpec()
        let encryptText3 =
          await SecurityUtils.encryptMessagePromise('AES256|CTR|PKCS7', symKey3, plainText3, ivParams)
        let decryptText3 =
          await SecurityUtils.decryptMessagePromise('AES256|CTR|PKCS7', symKey3, encryptText3, ivParams)
        expect(decryptText3.data.toString()).assertEqual(plainText3.data.toString())
      } catch (error) {
        let err = error as BusinessError
        console.error(`Failed to use AES-CTR-256 for encryption and decryption. error: ${JSON.stringify(err)}`)
        expect(false).assertEqual(true)
      }
      done()
    })

    /*
     * @tc.number: S|STD-SECURITY-0312
     * @tc.name: testSupportAESCCM128Alg0100
     * @tc.desc: 【S|STD-SECURITY-0312】必须支持 AES 对称加密算法，分组模式支持 ECB、OFB、CFB、CTR、CCM、
     *            密钥长度支持 128、192、256 位。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSupportAESCCM128Alg0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let keyData1 = new Uint8Array(buffer.from('12345678abcdefgh', 'utf8').buffer)
        let symKey1 = await SecurityUtils.genSymKeyByData(keyData1, 'AES128')
        let message1 = "This is a AES-CCM-128 test"
        let plainText1: cryptoFramework.DataBlob = {
          data: new Uint8Array(buffer.from(message1, 'utf-8').buffer)
        }
        let ccmParams = SecurityUtils.genCcmParamsSpec()
        let encryptText1 =
          await SecurityUtils.encryptMessageByAESCCMPromise('AES128|CCM|PKCS7', symKey1, plainText1, ccmParams)
        let decryptText1 =
          await SecurityUtils.decryptMessageByAESCCMPromise('AES128|CCM|PKCS7', symKey1, encryptText1, ccmParams)
        expect(decryptText1.data.toString()).assertEqual(plainText1.data.toString())
      } catch (error) {
        let err = error as BusinessError
        console.error(`Failed to use AES-CCM-128 for encryption and decryption. error: ${JSON.stringify(err)}`)
        expect(false).assertEqual(true)
      }
      done()
    })

    /*
     * @tc.number: S|STD-SECURITY-0312
     * @tc.name: testSupportAESCCM192Alg0100
     * @tc.desc: 【S|STD-SECURITY-0312】必须支持 AES 对称加密算法，分组模式支持 ECB、OFB、CFB、CTR、CCM、
     *            密钥长度支持 128、192、256 位。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSupportAESCCM192Alg0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let keyData2 = new Uint8Array(buffer.from('12345678abcdefgh12345678', 'utf8').buffer)
        let symKey2 = await SecurityUtils.genSymKeyByData(keyData2, 'AES192')
        let message2 = "This is a AES-CCM-192 test"
        let plainText2: cryptoFramework.DataBlob = {
          data: new Uint8Array(buffer.from(message2, 'utf-8').buffer)
        }
        let ccmParams = SecurityUtils.genCcmParamsSpec()
        let encryptText2 =
          await SecurityUtils.encryptMessageByAESCCMPromise('AES192|CCM|PKCS7', symKey2, plainText2, ccmParams)
        let decryptText2 =
          await SecurityUtils.decryptMessageByAESCCMPromise('AES192|CCM|PKCS7', symKey2, encryptText2, ccmParams)
        expect(decryptText2.data.toString()).assertEqual(plainText2.data.toString())
      } catch (error) {
        let err = error as BusinessError
        console.error(`Failed to use AES-CCM-192 for encryption and decryption. error: ${JSON.stringify(err)}`)
        expect(false).assertEqual(true)
      }
      done()
    })

    /*
     * @tc.number: S|STD-SECURITY-0312
     * @tc.name: testSupportAESCCM256Alg0100
     * @tc.desc: 【S|STD-SECURITY-0312】必须支持 AES 对称加密算法，分组模式支持 ECB、OFB、CFB、CTR、CCM、
     *            密钥长度支持 128、192、256 位。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSupportAESCCM256Alg0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let keyData3 = new Uint8Array(buffer.from('12345678abcdefgh12345678abcdefgh', 'utf8').buffer)
        let symKey3 = await SecurityUtils.genSymKeyByData(keyData3, 'AES256')
        let message3 = "This is a AES-CCM-256 test"
        let plainText3: cryptoFramework.DataBlob = {
          data: new Uint8Array(buffer.from(message3, 'utf-8').buffer)
        }
        let ccmParams = SecurityUtils.genCcmParamsSpec()
        let encryptText3 =
          await SecurityUtils.encryptMessageByAESCCMPromise('AES256|CCM|PKCS7', symKey3, plainText3, ccmParams)
        let decryptText3 =
          await SecurityUtils.decryptMessageByAESCCMPromise('AES256|CCM|PKCS7', symKey3, encryptText3, ccmParams)
        expect(decryptText3.data.toString()).assertEqual(plainText3.data.toString())
      } catch (error) {
        let err = error as BusinessError
        console.error(`Failed to use AES-CCM-256 for encryption and decryption. error: ${JSON.stringify(err)}`)
        expect(false).assertEqual(true)
      }
      done()
    })

    /*
     * @tc.number: S|STD-SECURITY-0313
     * @tc.name: testSupportRSA3072Alg0100
     * @tc.desc: 【S|STD-SECURITY-0313】必须支持非对称加密算法 RSA，包括 2048 位、3072 位、4096 位，
     *            能够实现密钥管理、加解密以及签名服务。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSupportRSA3072Alg0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let keyGenAlg = "RSA3072"
        let generator = cryptoFramework.createAsyKeyGenerator(keyGenAlg)
        let keyPair = await generator.generateKeyPair()
        let signAlg = "RSA3072|PKCS1|SHA256"
        let input: cryptoFramework.DataBlob = {
          data: new Uint8Array(buffer.from("This is a RSA3072 test", 'utf8').buffer)
        };
        let signData = await SecurityUtils.signMessagePromise(signAlg, input, keyPair.priKey)
        let verifyResult = await SecurityUtils.verifyMessagePromise(signAlg, input, signData, keyPair.pubKey)
        expect(verifyResult).assertTrue()
      } catch (error) {
        let err = error as BusinessError
        console.error(`Failed to use RSA3072 for sign and verify. error: ${JSON.stringify(err)}`)
        expect(false).assertEqual(true)
      }
      done()
    })

    /*
     * @tc.number: S|STD-SECURITY-0313
     * @tc.name: testSupportRSA4096Alg0100
     * @tc.desc: 【S|STD-SECURITY-0313】必须支持非对称加密算法 RSA，包括 2048 位、3072 位、4096 位，
     *            能够实现密钥管理、加解密以及签名服务。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSupportRSA4096Alg0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let keyGenAlg = "RSA4096"
        let generator = cryptoFramework.createAsyKeyGenerator(keyGenAlg)
        let keyPair = await generator.generateKeyPair()
        let signAlg = "RSA4096|PKCS1|SHA256"
        let input: cryptoFramework.DataBlob = {
          data: new Uint8Array(buffer.from("This is a RSA4096 test", 'utf8').buffer)
        };
        let signData = await SecurityUtils.signMessagePromise(signAlg, input, keyPair.priKey)
        let verifyResult = await SecurityUtils.verifyMessagePromise(signAlg, input, signData, keyPair.pubKey)
        expect(verifyResult).assertTrue()
      } catch (error) {
        let err = error as BusinessError
        console.error(`Failed to use RSA4096 for sign and verify. error: ${JSON.stringify(err)}`)
        expect(false).assertEqual(true)
      }
      done()
    })

    /*
     * @tc.number: S|STD-SECURITY-0314
     * @tc.name: testSupportSignatureVerifyAlg0100
     * @tc.desc: 【S|STD-SECURITY-0314】支持椭圆曲线签名算法 ECDSA 和密钥协商算法 ECDH，至少支持 P256 曲线；
     *            支持椭圆曲线签名算法 ED25519 和密钥协商算法 X25519、25519曲线。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSupportSignatureVerifyAlg0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let keyGenAlg = "ECC256"
        let generator = cryptoFramework.createAsyKeyGenerator(keyGenAlg)
        let keyPair = await generator.generateKeyPair()
        let signAlg = "ECC256|SHA256"
        let input: cryptoFramework.DataBlob = {
          data: new Uint8Array(buffer.from("This is a ECDSA test", 'utf8').buffer)
        };
        let signData = await SecurityUtils.signMessagePromise(signAlg, input, keyPair.priKey)
        let verifyResult = await SecurityUtils.verifyMessagePromise(signAlg, input, signData, keyPair.pubKey)
        expect(verifyResult).assertTrue()
      } catch (error) {
        let err = error as BusinessError
        console.error(`Failed to use ECDSA. error: ${JSON.stringify(err)}`)
        expect(false).assertEqual(true)
      }
      try {
        let keyGenAlg = "Ed25519"
        let generator = cryptoFramework.createAsyKeyGenerator(keyGenAlg)
        let keyPair = await generator.generateKeyPair()
        let signAlg = "Ed25519"
        let input: cryptoFramework.DataBlob = {
          data: new Uint8Array(buffer.from("This is a ED25519 test", 'utf8').buffer)
        };
        let signData = await SecurityUtils.signMessagePromise(signAlg, input, keyPair.priKey)
        let verifyResult = await SecurityUtils.verifyMessagePromise(signAlg, input, signData, keyPair.pubKey)
        expect(verifyResult).assertTrue()
      } catch (error) {
        let err = error as BusinessError
        console.error(`Failed to use ED25519. error: ${JSON.stringify(err)}`)
        expect(false).assertEqual(true)
      }
      done()
    })

    /*
     * @tc.number: S|STD-SECURITY-0314
     * @tc.name: testSupportKeySignatureAlg0100
     * @tc.desc: 【S|STD-SECURITY-0314】支持椭圆曲线签名算法 ECDSA 和密钥协商算法 ECDH，至少支持 P256 曲线；
     *            支持椭圆曲线签名算法 ED25519 和密钥协商算法 X25519、25519曲线。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSupportKeySignatureAlg0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let eccGen = cryptoFramework.createAsyKeyGenerator('ECC256')
        let keyPairA = await eccGen.generateKeyPair()
        let keyPairB = await eccGen.generateKeyPair()
        let eccKeyAgreement = cryptoFramework.createKeyAgreement('ECC256')
        let secret1 = await eccKeyAgreement.generateSecret(keyPairB.priKey, keyPairA.pubKey)
        let secret2 = await eccKeyAgreement.generateSecret(keyPairA.priKey, keyPairB.pubKey)
        expect(secret1.data.toString()).assertEqual(secret2.data.toString())
      } catch (error) {
        let err = error as BusinessError
        console.error(`Failed to use ECDH. error: ${JSON.stringify(err)}`)
        expect(false).assertEqual(true)
      }
      try {
        let eccGen = cryptoFramework.createAsyKeyGenerator('X25519')
        let keyPairA = await eccGen.generateKeyPair()
        let keyPairB = await eccGen.generateKeyPair()
        let eccKeyAgreement = cryptoFramework.createKeyAgreement('X25519')
        let secret1 = await eccKeyAgreement.generateSecret(keyPairB.priKey, keyPairA.pubKey)
        let secret2 = await eccKeyAgreement.generateSecret(keyPairA.priKey, keyPairB.pubKey)
        expect(secret1.data.toString()).assertEqual(secret2.data.toString())
      } catch (error) {
        let err = error as BusinessError
        console.error(`Failed to use X25519. error: ${JSON.stringify(err)}`)
        expect(false).assertEqual(true)
      }
      done()
    })

    /*
    * @tc.number: S|STD-SECURITY-0314
    * @tc.name: testSupportKeyAgreementAlg0100
    * @tc.desc: 【S|STD-SECURITY-0314】支持椭圆曲线签名算法 ECDSA 和密钥协商算法 ECDH，至少支持 P256 曲线；
    *            支持椭圆曲线签名算法 ED25519 和密钥协商算法 X25519、25519曲线。
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 0
    */
    it('testSupportKeyAgreementAlg0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let eccGen = cryptoFramework.createAsyKeyGenerator('ECC256')
        let keyPairA = await eccGen.generateKeyPair()
        let keyPairB = await eccGen.generateKeyPair()
        let eccKeyAgreement = cryptoFramework.createKeyAgreement('ECC256')
        let secret1 = await eccKeyAgreement.generateSecret(keyPairB.priKey, keyPairA.pubKey)
        let secret2 = await eccKeyAgreement.generateSecret(keyPairA.priKey, keyPairB.pubKey)
        expect(secret1.data.toString()).assertEqual(secret2.data.toString())
      } catch (error) {
        let err = error as BusinessError
        console.error(`Failed to use ECDH. error: ${JSON.stringify(err)}`)
        expect(false).assertEqual(true)
      }
      try {
        let eccGen = cryptoFramework.createAsyKeyGenerator('X25519')
        let keyPairA = await eccGen.generateKeyPair()
        let keyPairB = await eccGen.generateKeyPair()
        let eccKeyAgreement = cryptoFramework.createKeyAgreement('X25519')
        let secret1 = await eccKeyAgreement.generateSecret(keyPairB.priKey, keyPairA.pubKey)
        let secret2 = await eccKeyAgreement.generateSecret(keyPairA.priKey, keyPairB.pubKey)
        expect(secret1.data.toString()).assertEqual(secret2.data.toString())
      } catch (error) {
        let err = error as BusinessError
        console.error(`Failed to use X25519. error: ${JSON.stringify(err)}`)
        expect(false).assertEqual(true)
      }
      done()
    })

    /*
    * @tc.number: STD-SECURITY-0315
    * @tc.name: testKeyStorage0100
    * @tc.desc: 【STD-SECURITY-0315】HUKS 应提供密钥安全存储能力，保护业务所存储密钥的机密性与完整性。
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 0
    */
    it('testKeyStorage0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let keyAlias = 'hkdf_key'
      try {
        let generateRes: [boolean, huks.HuksOptions] = await SecurityUtils.generateKeyItem(keyAlias,
          huks.HuksKeyStorageType.HUKS_STORAGE_ONLY_USED_IN_HUKS)
        let result = generateRes[0]
        let huksOptions = generateRes[1]
        expect(result).assertTrue()
        expect(await huks.isKeyItemExist(keyAlias, huksOptions)).assertTrue()
        expect(SecurityUtils.deleteKeyItem(keyAlias, huksOptions))
      } catch (error) {
        let err = error as BusinessError;
        console.error(`Failed to generate key item. error: ${JSON.stringify(err)}`)
        expect(false).assertEqual(true)
      }
      done()
    })

    /*
     * @tc.number: STD-SECURITY-0316
     * @tc.name: testKeyIdentityAssociation0100
     * @tc.desc: 【STD-SECURITY-0316】业务存储密钥时，系统级的密钥管理模块应将该业务的身份与密钥进行关联存储，并对该业务身份进行完整性保护。
     *           【STD-SECURITY-0317】业务访问密钥时，系统级的密钥管理模块应判断业务身份，确认调用方是该密钥合法的属主。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testKeyIdentityAssociation0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(await AbilityUtils.startAbility('com.acts.pcs.arktstest', 'TestAbility', abilityContext)).assertTrue()
      let driver = Driver.create()
      await driver.delayMs(1000)
      let testAssistWantInfo: Want = {
        uri: 'http://assist.arkts.pcs.acts.com',
        type: "pcs/test"
      }
      expect(await AbilityUtils.startAbilityImplicitly(testAssistWantInfo, abilityContext)).assertTrue()
      await driver.delayMs(5000)
      let openButton = await driver.findComponent(ON.text('打开').inWindow('com.acts.pcs.arktstest'))
      if(openButton != undefined && openButton != null) {
        await openButton.click()
        await driver.delayMs(2000)
      }
      let allowButton1 = await driver.findComponent(ON.text('允许'))
      if(allowButton1 != undefined && allowButton1 != null) {
        await allowButton1.click()
        await driver.delayMs(2000)
      }
      let allowButton2 = await driver.findComponent(ON.text('本次允许'))
      if(allowButton2 != undefined && allowButton2 != null) {
        await allowButton2.click()
        await driver.delayMs(2000)
      }
      let button = await driver.findComponent(ON.id('generateKey').inWindow('com.acts.pcs.arkts.assist'))
      await driver.delayMs(1000)
      await button.click()
      await driver.delayMs(2000)
      let text = await driver.findComponent(ON.id('isKeyStoraged').inWindow('com.acts.pcs.arkts.assist'))
      expect(await text.getText()).assertEqual('TRUE')
      let keyAlias = 'assist_key'
      try {
        let emptyOptions: huks.HuksOptions = {
          properties: []
        }
        expect(await huks.isKeyItemExist(keyAlias, emptyOptions)).assertFalse()
      } catch (error) {
        let err = error as BusinessError;
        console.error(`Failed to check key item. error: ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(12000011)
      }

      try {
        let generateRes: [boolean, huks.HuksOptions] = await SecurityUtils.generateKeyItem(keyAlias,
          huks.HuksKeyStorageType.HUKS_STORAGE_ONLY_USED_IN_HUKS)
        let result = generateRes[0]
        let huksOptions = generateRes[1]
        expect(result).assertTrue()
        expect(await huks.isKeyItemExist(keyAlias, huksOptions)).assertTrue()
        expect(SecurityUtils.deleteKeyItem(keyAlias, huksOptions))
      } catch (error) {
        let err = error as BusinessError
        console.error(`Failed to generate key item. error: ${JSON.stringify(err)}`)
        expect(false).assertEqual(true)
      }
      done()
    })

    /*
     * @tc.number: C-S|STD-SECURITY-0500
     * @tc.name: testFileRiskLevelEnable0100
     * @tc.desc: 【C-S|STD-SECURITY-0500】对于要求提供风险等级标签设置能力的系统，对应的文件系统（包括本地文件系统和分布式文件系统）
     *            应提供文件风险等级标签设置的能力，供业务设置数据风险等级。数据以文件形式（包括本地文件系统和分布式文件系统）存储的场景下，
     *            生成数据的应用或服务需要根据文件之中数据的最高风险等级为对应的文件设置风险等级标签并使能标签对应的机密性保护能力。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testFileRiskLevelEnable0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let pathDir = abilityContext.filesDir
        let filePath = pathDir + '/SecurityTest.txt'
        let file = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE)
        let securityLevels: Array<securityLabel.DataLevel> = ['s0', 's1', 's2', 's3', 's4']
        for (let securityLevel of securityLevels) {
          await securityLabel.setSecurityLabel(filePath, securityLevel)
          expect(await securityLabel.getSecurityLabel(filePath)).assertEqual(securityLevel)
        }
      } catch (error) {
        let err = error as BusinessError
        console.error(`Failed to set and get file securityLabel. error: ${JSON.stringify(err)}`)
        expect(false).assertTrue()
      }
      done()
    })

    /*
     * @tc.number: C-S|STD-SECURITY-0501
     * @tc.name: testDatabaseRiskLevelEnable0100
     * @tc.desc: 【C-S|STD-SECURITY-0501】对于要求提供风险等级标签设置能力的系统，对应的数据库系统（包括本地数据库和分布式数据库）
     *            应提供数据风险等级标签设置的能力，供业务使用设置风险等级。数据在数据库（包括本地数据库和分布式数据库）存储的场景下，
     *            生成数据的应用或服务以数据库文件（如.db 文件）为单位，按照数据库中存储数据的最高风险等级为数据库文件设置风险等级标签
     *            并使能标签对应的机密性保护能力。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDatabaseRiskLevelEnable0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let kvManagerConfig: distributedKVStore.KVManagerConfig = {
          context: abilityContext,
          bundleName: 'com.acts.pcs.arktstest'
        }
        let kvManager = distributedKVStore.createKVManager(kvManagerConfig)
        let securityLevels: Array<distributedKVStore.SecurityLevel> = [
          distributedKVStore.SecurityLevel.S1,
          distributedKVStore.SecurityLevel.S2,
          distributedKVStore.SecurityLevel.S3,
          distributedKVStore.SecurityLevel.S4
        ]
        for (let securityLevel of securityLevels) {
          let options: distributedKVStore.Options = {
            kvStoreType: distributedKVStore.KVStoreType.SINGLE_VERSION,
            securityLevel: securityLevel
          }
          let storeId = 'testdb_' + securityLevel.toString()
          let kvStore = await kvManager.getKVStore<distributedKVStore.SingleKVStore>(storeId, options)
          expect(kvStore != undefined).assertTrue()
          expect(await kvStore.getSecurityLevel()).assertEqual(securityLevel)
        }
      } catch (error) {
        let err = error as BusinessError
        console.error(`Failed to set and get database securityLabel. error: ${JSON.stringify(err)}`)
        expect(false).assertTrue()
      }
      done()
    })

    /*
     * @tc.number: STD-SECURITY-0201
     * @tc.name: testDriverNodeAccess
     * @tc.desc: 【STD-SECURITY-0201】不应给应用开放直接访问设备驱动节点的能力，需通过服务层访问。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDriverNodeAccess', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let driverList = ['/dev', '/dev/auth_ctrl', '/dev/bbox', '/dev/block', '/dev/bus', '/dev/char', '/dev/code_sign',
        '/dev/console', '/dev/cpu_dma_latency', '/dev/cec0', '/dev/dri', '/dev/fscklogs', '/dev/full', '/dev/fuse',
        '/dev/gpiochip0', '/dev/graphics', '/dev/vcs', '/dev/xpm', '/dev/zero', '/dev/tty']
      for(let deiverFile of driverList) {
        try {
          if(await fs.access(deiverFile)) {
            let file = fs.openSync(deiverFile, fs.OpenMode.READ_ONLY)
          }
        } catch (error) {
          let err = error as BusinessError
          console.error(`Failed to. error: ${JSON.stringify(err)}`)
		      expect((err.code == 13900012 || err.code == 13900006 || err.code == 13900001 || err.code == 13900002)).assertTrue();
        }
      }
      done()
    })
  })
}