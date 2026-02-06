import { describe, it, expect, TestType, Level, Size} from "@ohos/hypium"
import { batteryInfo, BusinessError, systemDateTime } from "@kit.BasicServicesKit"
import { systemTimer } from '@kit.BasicServicesKit';
import { inputMethod } from '@kit.IMEKit';
import { common, Want } from "@kit.AbilityKit";
import AbilityUtils from "./AbilityUtils";
import { image } from "@kit.ImageKit";
import { abilityDelegatorRegistry, Driver, On, ON } from "@kit.TestKit";
import  application from '@ohos.app.ability.application'
import { display } from "@kit.ArkUI";
import  audio  from '@ohos.multimedia.audio';
const delegator : abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const TAG  ='optionalSystemCapability';
const DELAY = 1000;

async function stopApplication(bundleName: string) {
  await delegator.executeShellCommand(`aa force-stop ${bundleName} `).then(result => {
    console.info(`UiTestCase, stop application finished: ${result}`)
  }).catch((err : BusinessError) => {
    console.error(`UiTestCase,stop application failed: ${err}`)
  })
}

export default function optionalSystemCapability() {
  describe('optionalSystemCapability', () => {
    /*
     * @tc.number: C-STD-SOFTWARE-00300
     * @tc.name: testPowerManagerQuery
     * @tc.desc: 【C-STD-SOFTWARE-00300】如果设备支持电池，则必须提供电池电量信息和充放电状态的查询能力和接口。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testPowerManagerQuery', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      console.log(`${TAG}, testPowerManagerQuery start`);
      let powerManagerSupported = canIUse("SystemCapability.PowerManager.BatteryManager.Core");
      if (powerManagerSupported) {
        try {
          let batterySOCInfo: number = batteryInfo.batterySOC;
          console.log(`${TAG},The chargingStatusInfo is: ${batterySOCInfo}`);
          expect(batterySOCInfo != 0).assertTrue();
          let chargingStatusInfo = batteryInfo.chargingStatus;
          console.log(`${TAG},The chargingStatusInfo is: ${chargingStatusInfo}`);
          expect(chargingStatusInfo >= 0).assertTrue();
        }catch (e) {
          console.log(`${TAG},The testPowerManagerQuery error is: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      }
      console.log(`${TAG}, testPowerManagerQuery end`);
    })

    /*
     * @tc.number: C-STD-SOFTWARE-1300
     * @tc.name: testCustomInputMethod
     * @tc.desc: 【C-STD-SOFTWARE-1302】必须支持第三方输入法应用。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testCustomInputMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      console.log(`${TAG}, testCustomInputMethod start`);
      let isInputMethod = canIUse("SystemCapability.MiscServices.InputMethodFramework");
      console.log(`${TAG},The  inputMethod is : ${ isInputMethod }`);
      if (isInputMethod) {
        try {
          let inputMethodSetting = inputMethod.getSetting();
          // 获取设备全量输入法hap。
          let allInputs = inputMethodSetting.getAllInputMethodsSync();
          // 获取自定义的输入法。
          let customInput = allInputs.find((item: inputMethod.InputMethodProperty) => item.name == 'com.acts.pcs.arkts.assist');
          console.log(`${TAG}, customInput is : ${JSON.stringify(customInput)}`);
          // 自定义输入法packageName
          expect(customInput).not().assertNull();
        } catch (err) {
          console.log(`${TAG},The  testCustomInputMethod error is : ${ JSON.stringify(err) }`);
          expect().assertFail();
        }
      }
      console.log(`${TAG}, testDefaultInputMethod end`);
    })

    /*
     * @tc.number: C-STD-SOFTWARE-1301
     * @tc.name: testInputMethodEngine
     * @tc.desc: 【C-STD-SOFTWARE-1100】必须完整实现输入法管理框架。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testInputMethodEngine', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      console.log(`${TAG}, testInputMethodEngine start`);
      let inputMethod = canIUse("SystemCapability.MiscServices.InputMethodFramework");
      console.log(`${TAG},The  inputMethod is : ${ inputMethod }`);
      expect(inputMethod).assertTrue();
      console.log(`${TAG}, testInputMethodEngine end`);
    })

    /*
     * @tc.number: C-STD-SOFTWARE-1302
     * @tc.name: testDefaultInputMethod
     * @tc.desc: 【C-STD-SOFTWARE-1302】必须预安装英文输入法应用。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDefaultInputMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      console.log(`${TAG}, testDefaultInputMethod start`);
      let isInputMethod = canIUse("SystemCapability.MiscServices.InputMethodFramework");
      console.log(`${TAG},The  inputMethod is : ${ isInputMethod }`);
      if (isInputMethod) {
        try {
          let defaultInput = inputMethod.getDefaultInputMethod();
          console.log(`${TAG}, defaultInput is : ${JSON.stringify(defaultInput)}`);
          // 设备默认安装非0
          expect(defaultInput).not().assertNull();
        } catch (err) {
          console.error(`Failed to getAllInputMethods: ${JSON.stringify(err)}`);
          expect().assertFail();
        }
      }
      console.log(`${TAG}, testDefaultInputMethod end`);
    })

    /*
     * @tc.number: C-S-SOFTWARE-1003
     * @tc.name: testJPEGDecoding
     * @tc.desc: 【C-S-SOFTWARE-1006】必须支持JPEG格式解码，支持基础和渐进式解码，支持JPEG(.jpg)容器格式。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testJPEGDecoding', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.log(`${TAG}, testJPEGDecoding start`);
      let abilityContext = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext
      const entryContext = await application.createModuleContext(abilityContext, 'entry');
      let img = await entryContext.resourceManager.getMediaContent($r('app.media.startIcon003'));
      let imageSource:image.ImageSource = image.createImageSource(img.buffer.slice(0));
      let decodingOptions : image.DecodingOptions = {
        //设置为AUTO会根据图片资源格式解码。
        desiredDynamicRange: image.DecodingDynamicRange.AUTO,
      }
      // 创建pixelMap
      await imageSource.createPixelMap(decodingOptions).then((pixelMap : image.PixelMap) => {
        console.log(`${TAG} testJPEGDecoding Succeeded in creating PixelMap`);
        let info = pixelMap.getImageInfoSync();
        console.log(`${TAG} testJPEGDecoding Succeeded in creating PixelMap info is: ${JSON.stringify(info)}`);
        const mimeType = info.mimeType;
        console.log(`${TAG} testJPEGDecoding Succeeded in creating PixelMap mimeType is: ${JSON.stringify(mimeType)}`);
        expect(mimeType).assertEqual('image/jpeg');
      }).catch((err : BusinessError) => {
        console.log(`${TAG} testJPEGDecoding Failed to create PixelMap error is: ${JSON.stringify(err)} `);
        expect().assertFail();
      });
      await imageSource.release();
      console.log(`${TAG}, testJPEGDecoding testPNGDecoding end`);
    })

    /*
     * @tc.number: C-S-SOFTWARE-1004
     * @tc.name: testGIFDecoding
     * @tc.desc: 【C-S-SOFTWARE-1006】必须支持GIF格式解码，支持GIF(.gif)容器格式。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testGIFDecoding', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.log(`${TAG}, testGIFDecoding start`);
      let abilityContext = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext
      const entryContext = await application.createModuleContext(abilityContext, 'entry');
      let img = await entryContext.resourceManager.getMediaContent($r('app.media.startIcon002'));
      let imageSource:image.ImageSource = image.createImageSource(img.buffer.slice(0));
      let decodingOptions : image.DecodingOptions = {
        //设置为AUTO会根据图片资源格式解码。
        desiredDynamicRange: image.DecodingDynamicRange.AUTO,
      }
      // 创建pixelMap
      await imageSource.createPixelMap(decodingOptions).then((pixelMap : image.PixelMap) => {
        console.log(`${TAG} testGIFDecoding Succeeded in creating PixelMap`);
        let info = pixelMap.getImageInfoSync();
        console.log(`${TAG} testGIFDecoding Succeeded in creating PixelMap info is: ${JSON.stringify(info)}`);
        const mimeType = info.mimeType;
        console.log(`${TAG} testGIFDecoding Succeeded in creating PixelMap mimeType is: ${JSON.stringify(mimeType)}`);
        expect(mimeType).assertEqual('image/gif');
      }).catch((err : BusinessError) => {
        console.log(`${TAG} testGIFDecoding Failed to create PixelMap error is: ${JSON.stringify(err)} `);
        expect().assertFail();
      });
      await imageSource.release();
      console.log(`${TAG}, testGIFDecoding testPNGDecoding end`);
    })

    /*
     * @tc.number: C-S-SOFTWARE-1005
     * @tc.name: testPNGDecoding
     * @tc.desc: 【C-S-SOFTWARE-1005】必须支持PNG格式解码，支持PNG(.png)容器格式。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testPNGDecoding', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.log(`${TAG}, testPNGDecoding start`);
      let abilityContext = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext
      const entryContext = await application.createModuleContext(abilityContext, 'entry');
      let img = await entryContext.resourceManager.getMediaContent($r('app.media.startIcon'));
      let imageSource:image.ImageSource = image.createImageSource(img.buffer.slice(0));
      let decodingOptions : image.DecodingOptions = {
        //设置为AUTO会根据图片资源格式解码。
        desiredDynamicRange: image.DecodingDynamicRange.AUTO,
      }
      // 创建pixelMap
      await imageSource.createPixelMap(decodingOptions).then((pixelMap : image.PixelMap) => {
        console.log(`${TAG} testPNGDecoding Succeeded in creating PixelMap`);
        let info = pixelMap.getImageInfoSync();
        console.log(`${TAG} testPNGDecoding Succeeded in creating PixelMap info is: ${JSON.stringify(info)}`);
        const mimeType = info.mimeType;
        expect(mimeType).assertEqual('image/png');
      }).catch((err : BusinessError) => {
        console.log(`${TAG} testPNGDecoding Failed to create PixelMap error is: ${JSON.stringify(err)} `);
        expect().assertFail();
      });
      await imageSource.release();
      console.log(`${TAG}, testPNGDecoding testPNGDecoding end`);
    })

    /*
     * @tc.number: C-S-SOFTWARE-1006
     * @tc.name: testBMPDecoding
     * @tc.desc: 【C-S-SOFTWARE-1006】必须支持BMP格式解码，支持BMP(.bmp)容器格式。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testBMPDecoding', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.log(`${TAG}, testBMPDecoding start`);
      let abilityContext = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext
      const entryContext = await application.createModuleContext(abilityContext, 'entry');
      let img = await entryContext.resourceManager.getMediaContent($r('app.media.startIcon001'));
      let imageSource:image.ImageSource = image.createImageSource(img.buffer.slice(0));
      let decodingOptions : image.DecodingOptions = {
        //设置为AUTO会根据图片资源格式解码。
        desiredDynamicRange: image.DecodingDynamicRange.AUTO,
      }
      // 创建pixelMap
      await imageSource.createPixelMap(decodingOptions).then((pixelMap : image.PixelMap) => {
        console.log(`${TAG} testBMPDecoding Succeeded in creating PixelMap`);
        let info = pixelMap.getImageInfoSync();
        console.log(`${TAG} testBMPDecoding Succeeded in creating PixelMap info is: ${JSON.stringify(info)}`);
        const mimeType = info.mimeType;
        console.log(`${TAG} testBMPDecoding Succeeded in creating PixelMap mimeType is: ${JSON.stringify(mimeType)}`);
        expect(mimeType).assertEqual('image/bmp');
      }).catch((err : BusinessError) => {
        console.log(`${TAG} testBMPDecoding Failed to create PixelMap error is: ${JSON.stringify(err)} `);
        expect().assertFail();
      });
      await imageSource.release();
      console.log(`${TAG}, testBMPDecoding testPNGDecoding end`);
    })

    /*
     * @tc.number: C-S-SOFTWARE-1007
     * @tc.name: testBMPDecoding
     * @tc.desc: 【C-S-SOFTWARE-1007】必须支持WebP格式解码，支持WebP(.webp)容器格式。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testWEBPDecoding', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.log(`${TAG}, testWEBPDecoding start`);
      let abilityContext = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext
      const entryContext = await application.createModuleContext(abilityContext, 'entry');
      let img = await entryContext.resourceManager.getMediaContent($r('app.media.startIcon005'));
      let imageSource:image.ImageSource = image.createImageSource(img.buffer.slice(0));
      let decodingOptions : image.DecodingOptions = {
        //设置为AUTO会根据图片资源格式解码。
        desiredDynamicRange: image.DecodingDynamicRange.AUTO,
      }
      // 创建pixelMap
      await imageSource.createPixelMap(decodingOptions).then((pixelMap : image.PixelMap) => {
        console.log(`${TAG} testWEBPDecoding Succeeded in creating PixelMap`);
        let info = pixelMap.getImageInfoSync();
        console.log(`${TAG} testWEBPDecoding Succeeded in creating PixelMap info is: ${JSON.stringify(info)}`);
        const mimeType = info.mimeType;
        console.log(`${TAG} testWEBPDecoding Succeeded in creating PixelMap mimeType is: ${JSON.stringify(mimeType)}`);
        expect(mimeType).assertEqual('image/webp');
      }).catch((err : BusinessError) => {
        console.log(`${TAG} testWEBPDecoding Failed to create PixelMap error is: ${JSON.stringify(err)} `);
        expect().assertFail();
      });
      await imageSource.release();
      console.log(`${TAG}, testWEBPDecoding  end`);
    })


    /*
     * @tc.number: C-STD-SOFTWARE-1000
     * @tc.name: testBMPDecoding
     * @tc.desc: 【C-STD-SOFTWARE-1000】必须支持JPEG格式编码。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testJPEGPacker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.log(`${TAG}, testPNGPacker start`);
      try {
        let context = await abilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility();
        const entryContext = await application.createModuleContext(context.context, 'entry');
        let img = await entryContext.resourceManager.getMediaContent($r('app.media.startIcon'));
        let imageSource:image.ImageSource = image.createImageSource(img.buffer.slice(0));
        let decodingOptions : image.DecodingOptions = {
          //设置为AUTO会根据图片资源格式解码。
          desiredDynamicRange: image.DecodingDynamicRange.AUTO,
        }
        // 创建pixelMap
        let pixelMap = await imageSource.createPixelMap(decodingOptions);
        let info = pixelMap.getImageInfoSync();
        console.log(`${TAG} testPNGPacker Succeeded in creating PixelMap info is: ${JSON.stringify(info)}`);
        // 编码
        const imagePackerApi = image.createImagePacker();
        let packOpts : image.PackingOption = { format:"image/jpeg", quality:98 };
        await imagePackerApi.packToData(pixelMap, packOpts);
      }catch (error) {
        console.log(`${TAG} testPNGPacker error is: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      console.log(`${TAG}, testPNGPacker end`);
    })


    /*
     * @tc.number: C-STD-SOFTWARE-1001
     * @tc.name: testBMPDecoding
     * @tc.desc: 【C-S-SOFTWARE-1001】必须支持PNG格式编码。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testPNGPacker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.log(`${TAG}, testPNGPacker start`);
      try {
        let context = await abilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility();
        const entryContext = await application.createModuleContext(context.context, 'entry');
        let img = await entryContext.resourceManager.getMediaContent($r('app.media.startIcon'));
        let imageSource:image.ImageSource = image.createImageSource(img.buffer.slice(0));
        let decodingOptions : image.DecodingOptions = {
          //设置为AUTO会根据图片资源格式解码。
          desiredDynamicRange: image.DecodingDynamicRange.AUTO,
        }
        // 创建pixelMap
        let pixelMap = await imageSource.createPixelMap(decodingOptions);
        // 判断pixelmap是否为hdr内容
        let info = pixelMap.getImageInfoSync();
        console.log("pixelmap isHdr:" + info.isHdr);
        console.log(`${TAG} testPNGPacker Succeeded in creating PixelMap info is: ${JSON.stringify(info)}`);
        // 编码
        const imagePackerApi = image.createImagePacker();
        let packOpts : image.PackingOption = { format:"image/png", quality:98 };
        await imagePackerApi.packToData(pixelMap, packOpts);
      }catch (error) {
        console.log(`${TAG} testPNGPacker error is: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      console.log(`${TAG}, testPNGPacker end`);
    })

    /*
     * @tc.number: C-STD-SOFTWARE-1003
     * @tc.name: testBMPDecoding
     * @tc.desc: 【C-S-SOFTWARE-1003】必须支持WebP格式编码。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testWEBPPacker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.log(`${TAG}, testPNGPacker start`);
      try {
        let context = await abilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility();
        const entryContext = await application.createModuleContext(context.context, 'entry');
        let img = await entryContext.resourceManager.getMediaContent($r('app.media.startIcon'));
        let imageSource:image.ImageSource = image.createImageSource(img.buffer.slice(0));
        let decodingOptions : image.DecodingOptions = {
          //设置为AUTO会根据图片资源格式解码。
          desiredDynamicRange: image.DecodingDynamicRange.AUTO,
        }
        // 创建pixelMap
        let pixelMap = await imageSource.createPixelMap(decodingOptions);
        // 判断pixelmap是否为hdr内容
        let info = pixelMap.getImageInfoSync();
        console.log("pixelmap isHdr:" + info.isHdr);
        console.log(`${TAG} testPNGPacker Succeeded in creating PixelMap info is: ${JSON.stringify(info)}`);
        // 编码
        const imagePackerApi = image.createImagePacker();
        let packOpts : image.PackingOption = { format:"image/webp", quality:98 };
        await imagePackerApi.packToData(pixelMap, packOpts);
      }catch (error) {
        console.log(`${TAG} testPNGPacker error is: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      console.log(`${TAG}, testPNGPacker end`);
    })

    /*
     * @tc.number: C-STD-SOFTWARE-1401
     * @tc.name: testSetTime
     * @tc.desc: 【C-STD-SOFTWARE-1401】必须通过权限机制管控修改系统时间时区的行为。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("testSetTime", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.log(`${TAG}, testSetTime start`);
      let time = 1611081385000;
      try {
        await systemDateTime.setTime(time);
        console.log(`${TAG}, testSetTime successed to set time. message`);
        expect().assertFail();
      } catch(e) {
        let error = e as BusinessError;
        console.log(`${TAG}, testSetTime Failed to set time. message: ${error.message}, code: ${error.code}`);
      }
      console.log(`${TAG}, testSetTime end`);
    })

    /*
     * @tc.number: C-STD-SOFTWARE-1400
     * @tc.name: testSetTimeOut
     * @tc.desc: 【 C-STD-SOFTWARE-1400】必须通过限制定时器拉起已经退出的进程的行为。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("testSetTimeOut", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.log(`${TAG}, testSetTimeOut start`);
      let options: systemTimer.TimerOptions = {
        type: systemTimer.TIMER_TYPE_REALTIME,
        repeat:false
      };
      try {
        const id = await systemTimer.createTimer(options);
        console.log(`${TAG}, testSetTimeOut createTimer id is: ${id}`);
        expect().assertFail();
      } catch(e) {
        let error = e as BusinessError;
        console.log(`${TAG}, testSetTimeOut createTimer error is: ${JSON.stringify(error)}`);
      }
      console.log(`${TAG}, testSetTime end`);
    })

    /*
     * @tc.number: C-STD-SOFTWARE-1800
     * @tc.name: testHomeEvent
     * @tc.desc: 【C-STD-SOFTWARE-1800】电源键, Home键, 静音键必须系统处理, 禁止发送给应用, 返回键必须发送到应用处理。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("testHomeEvent", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.log(`${TAG}, testHomeEvent start`);
      let driver = Driver.create();
      let abilityContext = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext;
      const want: Want = {
        bundleName: 'com.acts.pcs.arktstest',
        abilityName: 'EntryAbility'
      }
      await AbilityUtils.startAbilityImplicitly(want, abilityContext);
      await driver.delayMs(DELAY);
      // 电源键
      await driver.triggerKey(18);
      await driver.delayMs(DELAY);
      const btComponent = await driver.findComponent(ON.id('firstButton'));
      expect(btComponent == null).assertTrue();
      await driver.wakeUpDisplay();
      await driver.delayMs(DELAY);
      await driver.swipe(300, 600, 300, 100);
      await driver.delayMs(DELAY);
      const isSupportAudio = canIUse('SystemCapability.Multimedia.Audio.Volume')
      console.log(`${TAG}, testHomeEvent isSupportAudio is: ${ isSupportAudio }`);
      if (isSupportAudio) {
        const groupId: number = audio.DEFAULT_VOLUME_GROUP_ID;
        const audioManager = audio.getAudioManager();
        let audioVolumeManager: audio.AudioVolumeManager = audioManager.getVolumeManager();
        const audioVolumeGroupManager = await audioVolumeManager.getVolumeGroupManager(groupId);
        const isBeforeMuteMedia = await audioVolumeGroupManager.isMute(audio.AudioVolumeType.MEDIA);
        console.log(`${TAG}, testHomeEvent before isBeforeMuteMedia is: ${JSON.stringify(isBeforeMuteMedia)}`);
        // 静音键
        await driver.triggerKey(22);
        await driver.delayMs(DELAY);
        const isAfterMuteMedia = await audioVolumeGroupManager.isMute(audio.AudioVolumeType.MEDIA);
        console.log(`${TAG}, testHomeEvent after isAfterMuteMedia is: ${JSON.stringify(isAfterMuteMedia)}`);
        expect(isBeforeMuteMedia == !isAfterMuteMedia).assertTrue();
      }
      console.log(`${TAG}, testSetTime end`);
    })
  })
}