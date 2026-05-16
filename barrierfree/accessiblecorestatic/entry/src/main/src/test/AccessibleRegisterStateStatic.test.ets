import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import accessibility from '@ohos.accessibility'
import { BusinessError } from '@ohos.base';
import Rect from '@ohos.application.AccessibilityExtensionAbility';
import { Resource } from 'global.resource';
let domain: int = 0x0000;
let tag: string = 'testTag';

class Rect {
        left: number;
        top: number;
        width: number;
        height: number;
}

type CaptionsFontFamily = 'default' | 'monospacedSerif' | 'serif' | 'monospacedSansSerif' | 'sansSerif' | 'casual' | 'cursive' | 'smallCapitals';
type CaptionsFontEdgeType = 'none' | 'raised' | 'depressed' | 'uniform' | 'dropShadow';

let result: boolean = false;
const bundleName = 'com.huawei.hmos.cardistributedassist';
const triggerAction : accessibility.Action = 'accessibilityFocus';
const eventType : accessibility.EventType = 'accessibilityFocus';

export default function abilityTest() {
  describe("AccessibleRegisterStateStatic", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0100
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0100
     * @tc.desc   onAccessibilityStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0100', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0100');
      let callbackdata = (data:boolean) => {
        expect(data).assertEqual(false);
      }
      try {
        accessibility.onAccessibilityStateChange(callbackdata);
        accessibility.offAccessibilityStateChange(callbackdata);
        done();
      } catch (error) {
        hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0100 failed');
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0500
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0500
     * @tc.desc   The result of isOpenAccessibilitySync() should be boolean type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0500', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0500');
      try {
        let status = accessibility.isOpenAccessibilitySync();
        hilog.info(domain, tag, `AccessibilityApi: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0500 result: ${status}`);
        expect(status).assertEqual(false);
        expect(typeof (status)).assertEqual('boolean');
        done();
      } catch (error) {
        hilog.error(domain, tag,'SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0500 failed to isOpenAccessibilitySync because ');
        expect(null).assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0300
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0300
     * @tc.desc   SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0300', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0300');
      let callbackdata = (data:boolean) => {
        expect(data).assertEqual(false);
      }
      try {
        accessibility.onScreenReaderStateChange(callbackdata);
        accessibility.offScreenReaderStateChange(callbackdata);
        done();
      } catch (error) {
        hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0300 failed');
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0200
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0200
     * @tc.desc   onTouchGuideStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0200', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0200');
      let callbackdata = (data:boolean) => {
        expect(data).assertEqual(false);
      }
      try {
        accessibility.offTouchGuideStateChange(callbackdata);
        done();
      } catch (error) {
        hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0200 failed');
        expect(null).assertFail();
        done();
      }
    })

     /**
      * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0900
      * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0900
      * @tc.desc    The parameters input are all and 'enable', test the getAbilityLists() function,
      *             and the output is the list of AccessibilityAbilityInfo
      * @tc.size    SmallTest
      * @tc.type    User
      * @tc.level   Level 0
      */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0900', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0900 start');
      let abilityState = 'install';
      let abilityType = 'all';

      accessibility.getAccessibilityExtensionList(abilityType, abilityState).then((data: accessibility.AccessibilityAbilityInfo[]) => {
        console.info(`SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0900 Successded in get accessibility extension list: ${JSON.stringify(data)}`);
        expect(Array.isArray(data)).assertEqual(true);
        done();
      }).catch((err: Error) => {
        console.log('getAccessibilityExtensionList_promise error.');
        console.error('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0900 failed to AccessibilityExtensionListSync because ' + JSON.stringify(err));
        done();
      });


    })

     /**
      * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1000
      * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1000
      * @tc.desc    The parameters input are all and 'enable', test the getAbilityLists() function,
      *             and the output is the list of AccessibilityAbilityInfo
      * @tc.size    SmallTest
      * @tc.type    User
      * @tc.level   Level 0
      */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1000', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1000 start');
      let abilityState = 'disable';
      let abilityType = 'all';

      accessibility.getAccessibilityExtensionList(abilityType, abilityState).then((data: accessibility.AccessibilityAbilityInfo[]) => {
        console.info(`SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1000 Successded in get accessibility extension list: ${JSON.stringify(data)}`);
        expect(Array.isArray(data)).assertEqual(true);
        done();
      }).catch((err: Error) => {
        console.log('getAccessibilityExtensionList_promise error.');
        console.error('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1000 failed to AccessibilityExtensionListSync because ' + JSON.stringify(err));
        done();
      });

    })



     /**
      * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1700
      * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1700
      * @tc.desc    The parameters input are all and 'enable', test the getAbilityLists() function,
      *             and the output is the list of AccessibilityAbilityInfo
      * @tc.size    SmallTest
      * @tc.type    User
      * @tc.level   Level 0
      */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1700', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1700 start');
      let abilityState = 'install';
      let abilityType = 'all';

      accessibility.getAccessibilityExtensionList(abilityType, abilityState, (err: BusinessError | null, data: accessibility.AccessibilityAbilityInfo[] | undefined) => {
        if (err?.code) {
          console.log(`SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1700 failed to get accessibility extension list, Code is ${err?.code}, message is ${err?.message}`);
          done();
        }
        console.log(`SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1700 Succeeded in get accessibility extension list.` + JSON.stringify(data));
        expect(Array.isArray(data)).assertEqual(true);
        done();
      });

    })

     /**
      * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2500
      * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2500
      * @tc.desc    The result of Rect should be boolean type.
      * @tc.size    SmallTest
      * @tc.type    User
      * @tc.level   Level 0
      */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2500', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2500');
      try{
        let rect: Rect = new Rect();
        rect.left = 338;
        rect.top = 470;
        rect.width = 585;
        rect.height = 130;
        console.info(`Rect: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2500 rect Succeeded`);
        result = true
      } catch (error) {
        console.info(`Rect: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2500 rect false`);
        result = false
      }
      expect(result).assertEqual(true);
      done();

    })

   /**
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0800
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0800
    * @tc.desc    The parameters input are all and 'install', test the getAbilityLists() function,
    *             and the output is the list of AccessibilityAbilityInfo
    * @tc.size    SmallTest
    * @tc.type    User
    * @tc.level   Level 0
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0800', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0800');
      try {
          let abilityState = 'install';
          let abilityType = 'all';
          accessibility.getAccessibilityExtensionListSync(abilityType, abilityState);
          console.info(`AccessibilityExtensionListSync: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0800 successed`);
          result = true;
      } catch (exception) {
          console.error('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0800 failed to AccessibilityExtensionListSync because ' + JSON.stringify(exception));
          result = false;
      }
      expect(result).assertEqual(true);
      done();
    })

     /**
      * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2600
      * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2600
      * @tc.desc    The result of CaptionsStyle should be boolean type.
      * @tc.size    SmallTest
      * @tc.type    User
      * @tc.level   Level 0
      */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2600', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2600');
      try{
        let captionsStyle: accessibility.CaptionsStyle = {"fontFamily":"default","fontScale":0,"fontColor":"#000000ff","fontEdgeType":"none","backgroundColor":"#000000ff","windowColor":"#000000ff"};
        console.info(`Rect: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2600 CaptionsStyle Succeeded`);
        result = true
      } catch (error) {
        console.info(`Rect: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2600 CaptionsStyle false`);
        result = false
      }
      expect(result).assertEqual(true);
      done();
    })

     /**
      * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2700
      * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2700
      * @tc.desc    The parameters input are all and 'enable', test the getAbilityLists() function,
      *             and the output is the list of AccessibilityAbilityInfo
      * @tc.size    SmallTest
      * @tc.type    User
      * @tc.level   Level 0
      */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2700', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2700 start');
      let abilityState = 'install';
      let abilityType = 'all';
      accessibility.getAccessibilityExtensionList(abilityType, abilityState).then((data: accessibility.AccessibilityAbilityInfo[]) => {
        console.info(`SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2700 Successded in get accessibility extension list: ${JSON.stringify(data)}`);
        expect(typeof data[0].id === 'string').assertEqual(true);
        expect(typeof data[0].name === 'string').assertEqual(true);
        expect(typeof data[0].bundleName === 'string').assertEqual(true);
        expect(Array.isArray(data[0].targetBundleNames)).assertEqual(true);
        expect(Array.isArray(data[0].abilityTypes)).assertEqual(true);
        expect(Array.isArray(data[0].capabilities)).assertEqual(true);
        expect(typeof data[0].description === 'string').assertEqual(true);
        expect(Array.isArray(data[0].eventTypes)).assertEqual(true);
        expect(typeof data[0].needHide === 'boolean').assertEqual(true);
        expect(typeof data[0].label === 'string').assertEqual(true);
        done();
      }).catch((err: Error) => {
        console.log('getAccessibilityExtensionList_promise error.');
        console.error('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2700 failed to AccessibilityExtensionListSync because ' + JSON.stringify(err));
        done();
      });

    })

   /**
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2800
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2800
    * @tc.desc    The parameter input eventType is scroll, test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 0
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2800', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2800');
      let pageId = 1;

      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
      event.pageId = pageId;
      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `EventInfo: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2800 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `EventInfo: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2800 has error`);
        expect(null).assertFail();
        done();
      };
    })

   /**
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2900
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2900
    * @tc.desc    The parameter input eventType is scroll, test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 0
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2900', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2900');
      let beginIndex = 1;

      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
      event.beginIndex = beginIndex;
      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `EventInfo: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2900 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `EventInfo: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2900 has error`);
        expect(null).assertFail();
        done();
      };
    })

   /**
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3000
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3000
    * @tc.desc    The parameter input eventType is scroll, test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 0
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3000', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3000');
      let currentIndex = 1;

      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
      event.currentIndex = currentIndex;
      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `EventInfo: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3000 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `EventInfo: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3000 has error`);
        expect(null).assertFail();
        done();
      };
    })

   /**
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3100
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3100
    * @tc.desc    The parameter input eventType is scroll, test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 0
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3100', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3100');
      let endIndex = 1;

      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
      event.endIndex = endIndex;
      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `EventInfo: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3100 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `EventInfo: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3100 has error`);
        expect(null).assertFail();
        done();
      };
    })

   /**
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3200
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3200
    * @tc.desc    The parameter input eventType is scroll, test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 0
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3200', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3200');
      let itemCount = 1;

      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
      event.itemCount = itemCount;
      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `EventInfo: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3200 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `EventInfo: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3200 has error`);
        expect(null).assertFail();
        done();
      };
    })

   /**
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3300
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3300
    * @tc.desc    The typy of EventInfo is announceForAccessibilityNotInterrupt, The triggerAction of EventInfo is click ,The textAnnouncedForAccessibility of EventInfo is test123  test sendEvent() function
    *             The result of sendAccessibilityEvent() should be equal to a promise of undefined
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 0
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3300', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3300');
      let elementId = 1;

      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
      event.type = 'requestFocusForAccessibility'
      event.triggerAction = 'click'
      event.elementId = elementId;

      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `EventInfo: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3300 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `EventInfo: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3300 has error`);
        expect(null).assertFail();
        done();
      };

    })

   /**
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3400
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3400
    * @tc.desc    The typy of EventInfo is announceForAccessibilityNotInterrupt, The triggerAction of EventInfo is click ,The textAnnouncedForAccessibility of EventInfo is test123  test sendEvent() function
    *             The result of sendAccessibilityEvent() should be equal to a promise of undefined
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 0
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3400', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3400');
      let resource: Resource = {"bundleName":"com.huawei.hmos.cardistributedassist","moduleName":"description","id":1};

      let textResourceAnnouncedForAccessibility = resource;

      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
      event.type = 'requestFocusForAccessibility'
      event.triggerAction = 'common'
      event.textResourceAnnouncedForAccessibility = textResourceAnnouncedForAccessibility;

      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `EventInfo: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3400 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `EventInfo: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3400 has error`);
        expect(null).assertFail();
        done();
      };

    })

     /**
      * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1100
      * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1100
      * @tc.desc    The parameters input are all and 'enable', test the getAbilityLists() function,
      *             and the output is the list of AccessibilityAbilityInfo
      * @tc.size    SmallTest
      * @tc.type    User
      * @tc.level   Level 0
      */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1100', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1100 start');
      let abilityState = 'enable';
      let abilityType = 'all';

      accessibility.getAccessibilityExtensionList(abilityType, abilityState).then((data: accessibility.AccessibilityAbilityInfo[]) => {
        console.info(`SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1100 Successded in get accessibility extension list: ${JSON.stringify(data)}`);
        expect(Array.isArray(data)).assertEqual(true);
        expect(data.length === 0).assertTrue();
        done();
      }).catch((err: Error) => {
        console.log('getAccessibilityExtensionList_promise error.');
        console.error('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1100 failed to AccessibilityExtensionListSync because ' + JSON.stringify(err));
        done();
      });

    })

     /**
      * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1200
      * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1200
      * @tc.desc    The parameters input are all and 'enable', test the getAbilityLists() function,
      *             and the output is the list of AccessibilityAbilityInfo
      * @tc.size    SmallTest
      * @tc.type    User
      * @tc.level   Level 0
      */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1200', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1200 start');
      let abilityState = 'install';
      let abilityType = 'audible';

      accessibility.getAccessibilityExtensionList(abilityType, abilityState).then((data: accessibility.AccessibilityAbilityInfo[]) => {
        console.info(`SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1200 Successded in get accessibility extension list: ${JSON.stringify(data)}`);
        expect(Array.isArray(data)).assertEqual(true);
        done();
      }).catch((err: Error) => {
        console.log('getAccessibilityExtensionList_promise error.');
        console.error('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1200 failed to AccessibilityExtensionListSync because ' + JSON.stringify(err));
        done();
      });


    })

     /**
      * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1300
      * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1300
      * @tc.desc    The parameters input are all and 'enable', test the getAbilityLists() function,
      *             and the output is the list of AccessibilityAbilityInfo
      * @tc.size    SmallTest
      * @tc.type    User
      * @tc.level   Level 0
      */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1300', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1300 start');
      let abilityState = 'install';
      let abilityType = 'generic';

      accessibility.getAccessibilityExtensionList(abilityType, abilityState).then((data: accessibility.AccessibilityAbilityInfo[]) => {
        console.info(`SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1300 Successded in get accessibility extension list: ${JSON.stringify(data)}`);
        expect(Array.isArray(data)).assertEqual(true);
        done();
      }).catch((err: Error) => {
        console.log('getAccessibilityExtensionList_promise error.');
        console.error('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1300 failed to AccessibilityExtensionListSync because ' + JSON.stringify(err));
        done();
      });


    })

     /**
      * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1400
      * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1400
      * @tc.desc    The parameters input are all and 'enable', test the getAbilityLists() function,
      *             and the output is the list of AccessibilityAbilityInfo
      * @tc.size    SmallTest
      * @tc.type    User
      * @tc.level   Level 0
      */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1400', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1400 start');
      let abilityState = 'install';
      let abilityType = 'haptic';

      accessibility.getAccessibilityExtensionList(abilityType, abilityState).then((data: accessibility.AccessibilityAbilityInfo[]) => {
        console.info(`SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1400 Successded in get accessibility extension list: ${JSON.stringify(data)}`);
        expect(Array.isArray(data)).assertEqual(true);
        done();
      }).catch((err: Error) => {
        console.log('getAccessibilityExtensionList_promise error.');
        console.error('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1400 failed to AccessibilityExtensionListSync because ' + JSON.stringify(err));
        done();
      });


    })

     /**
      * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1500
      * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1500
      * @tc.desc    The parameters input are all and 'enable', test the getAbilityLists() function,
      *             and the output is the list of AccessibilityAbilityInfo
      * @tc.size    SmallTest
      * @tc.type    User
      * @tc.level   Level 0
      */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1500', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1500 start');
      let abilityState = 'install';
      let abilityType = 'spoken';

      accessibility.getAccessibilityExtensionList(abilityType, abilityState).then((data: accessibility.AccessibilityAbilityInfo[]) => {
        console.info(`SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1500 Successded in get accessibility extension list: ${JSON.stringify(data)}`);
        expect(Array.isArray(data)).assertEqual(true);
        done();
      }).catch((err: Error) => {
        console.log('getAccessibilityExtensionList_promise error.');
        console.error('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1500 failed to AccessibilityExtensionListSync because ' + JSON.stringify(err));
        done();
      });


    })

     /**
      * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1600
      * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1600
      * @tc.desc    The parameters input are all and 'enable', test the getAbilityLists() function,
      *             and the output is the list of AccessibilityAbilityInfo
      * @tc.size    SmallTest
      * @tc.type    User
      * @tc.level   Level 0
      */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1600', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1600 start');
      let abilityState = 'install';
      let abilityType = 'visual';

      accessibility.getAccessibilityExtensionList(abilityType, abilityState).then((data: accessibility.AccessibilityAbilityInfo[]) => {
        console.info(`SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1600 Successded in get accessibility extension list: ${JSON.stringify(data)}`);
        expect(Array.isArray(data)).assertEqual(true);
        done();
      }).catch((err: Error) => {
        console.log('getAccessibilityExtensionList_promise error.');
        console.error('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1600 failed to AccessibilityExtensionListSync because ' + JSON.stringify(err));
        done();
      });


    })


     /**
      * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1800
      * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1800
      * @tc.desc    The parameters input are all and 'enable', test the getAbilityLists() function,
      *             and the output is the list of AccessibilityAbilityInfo
      * @tc.size    SmallTest
      * @tc.type    User
      * @tc.level   Level 0
      */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1800', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1800 start');
      let abilityState = 'disable';
      let abilityType = 'all';

      accessibility.getAccessibilityExtensionList(abilityType, abilityState, (err: BusinessError | null, data: accessibility.AccessibilityAbilityInfo[] | undefined) => {
        if (err?.code) {
          console.log(`SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1800 failed to get accessibility extension list, Code is ${err?.code}, message is ${err?.message}`);
          done();
        }
        console.log(`SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1800 Succeeded in get accessibility extension list.` + JSON.stringify(data));
        expect(Array.isArray(data)).assertEqual(true);
        done();
      });

    })

     /**
      * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1900
      * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1900
      * @tc.desc    The parameters input are all and 'enable', test the getAbilityLists() function,
      *             and the output is the list of AccessibilityAbilityInfo
      * @tc.size    SmallTest
      * @tc.type    User
      * @tc.level   Level 0
      */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1900', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1900 start');
      let abilityState = 'enable';
      let abilityType = 'all';

      accessibility.getAccessibilityExtensionList(abilityType, abilityState, (err: BusinessError | null, data: accessibility.AccessibilityAbilityInfo[] | undefined) => {
        if (err?.code) {
          console.log(`SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1900 failed to get accessibility extension list, Code is ${err?.code}, message is ${err?.message}`);
          done();
        }
        console.log(`SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_1900 Succeeded in get accessibility extension list.` + JSON.stringify(data));
        if (data) {
          expect(data.length === 0).assertTrue();
        }
        expect(Array.isArray(data)).assertEqual(true);
        done();
      });

    })

     /**
      * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2000
      * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2000
      * @tc.desc    The parameters input are all and 'enable', test the getAbilityLists() function,
      *             and the output is the list of AccessibilityAbilityInfo
      * @tc.size    SmallTest
      * @tc.type    User
      * @tc.level   Level 0
      */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2000', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2000 start');
      let abilityState = 'install';
      let abilityType = 'audible';

      accessibility.getAccessibilityExtensionList(abilityType, abilityState, (err: BusinessError | null, data: accessibility.AccessibilityAbilityInfo[] | undefined) => {
        if (err?.code) {
          console.log(`SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2000 failed to get accessibility extension list, Code is ${err?.code}, message is ${err?.message}`);
          done();
        }
        console.log(`SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2000 Succeeded in get accessibility extension list.` + JSON.stringify(data));
        expect(Array.isArray(data)).assertEqual(true);
        done();
      });

    })

     /**
      * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2100
      * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2100
      * @tc.desc    The parameters input are all and 'enable', test the getAbilityLists() function,
      *             and the output is the list of AccessibilityAbilityInfo
      * @tc.size    SmallTest
      * @tc.type    User
      * @tc.level   Level 0
      */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2100', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2100 start');
      let abilityState = 'install';
      let abilityType = 'generic';

      accessibility.getAccessibilityExtensionList(abilityType, abilityState, (err: BusinessError | null, data: accessibility.AccessibilityAbilityInfo[] | undefined) => {
        if (err?.code) {
          console.log(`SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2100 failed to get accessibility extension list, Code is ${err?.code}, message is ${err?.message}`);
          done();
        }
        console.log(`SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2100 Succeeded in get accessibility extension list.` + JSON.stringify(data));
        expect(Array.isArray(data)).assertEqual(true);
        done();
      });

    })


     /**
      * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2200
      * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2200
      * @tc.desc    The parameters input are all and 'enable', test the getAbilityLists() function,
      *             and the output is the list of AccessibilityAbilityInfo
      * @tc.size    SmallTest
      * @tc.type    User
      * @tc.level   Level 0
      */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2200', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2200 start');
      let abilityState = 'install';
      let abilityType = 'haptic';

      accessibility.getAccessibilityExtensionList(abilityType, abilityState, (err: BusinessError | null, data: accessibility.AccessibilityAbilityInfo[] | undefined) => {
        if (err?.code) {
          console.log(`SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2200 failed to get accessibility extension list, Code is ${err?.code}, message is ${err?.message}`);
          done();
        }
        console.log(`SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2200 Succeeded in get accessibility extension list.` + JSON.stringify(data));
        expect(Array.isArray(data)).assertEqual(true);
        done();
      });

    })

     /**
      * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2300
      * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2300
      * @tc.desc    The parameters input are all and 'enable', test the getAbilityLists() function,
      *             and the output is the list of AccessibilityAbilityInfo
      * @tc.size    SmallTest
      * @tc.type    User
      * @tc.level   Level 0
      */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2300', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2300 start');
      let abilityState = 'install';
      let abilityType = 'spoken';

      accessibility.getAccessibilityExtensionList(abilityType, abilityState, (err: BusinessError | null, data: accessibility.AccessibilityAbilityInfo[] | undefined) => {
        if (err?.code) {
          console.log(`SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2300 failed to get accessibility extension list, Code is ${err?.code}, message is ${err?.message}`);
          done();
        }
        console.log(`SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2300 Succeeded in get accessibility extension list.` + JSON.stringify(data));
        expect(Array.isArray(data)).assertEqual(true);
        done();
      });

    })

     /**
      * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2400
      * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2400
      * @tc.desc    The parameters input are all and 'enable', test the getAbilityLists() function,
      *             and the output is the list of AccessibilityAbilityInfo
      * @tc.size    SmallTest
      * @tc.type    User
      * @tc.level   Level 0
      */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2400', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2400 start');
      let abilityState = 'install';
      let abilityType = 'visual';

      accessibility.getAccessibilityExtensionList(abilityType, abilityState, (err: BusinessError | null, data: accessibility.AccessibilityAbilityInfo[] | undefined) => {
        if (err?.code) {
          console.log(`SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2400 failed to get accessibility extension list, Code is ${err?.code}, message is ${err?.message}`);
          done();
        }
        console.log(`SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_2400 Succeeded in get accessibility extension list.` + JSON.stringify(data));
        expect(Array.isArray(data)).assertEqual(true);
        done();
      });
    })

    /**
 	     * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3500
 	     * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3500
 	     * @tc.desc    getTouchModeSync
 	     * @tc.size    SmallTest
 	     * @tc.type    User
 	     * @tc.level   Level 0
 	     */
 	     it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3500', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
 	       console.info('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3500');
 	       try {
 	         let status = accessibility.getTouchModeSync();
 	         console.info(`AccessibilityApi: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3500 result: ${status}`);
 	         expect(typeof (status)).assertEqual('string');
 	         done();
 	       } catch (exception) {
 	           console.error('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3500 failed to getTouchModeSync because ' + JSON.stringify(exception));
 	       }
 	 
 	     })
 	 
 	      /**
 	       * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3600
 	       * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3600
 	       * @tc.desc    The result of isAnimationReduceEnabledSync() should be boolean type.
 	       * @tc.size    SmallTest
 	       * @tc.type    User
 	       * @tc.level   Level 0
 	       */
 	     it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3600', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
 	       console.info('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3600');
 	       try {
 	         let status = accessibility.isAnimationReduceEnabledSync();
 	         console.info(`AccessibilityExtensionListSync: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3600 result: ${status}`);
 	         expect(status).assertEqual(false);
 	         done();
 	       } catch (exception) {
 	         console.error('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3600 failed to isAnimationReduceEnabledSync because ' + JSON.stringify(exception));
 	         done();
 	       }
 	     })
 	 
 	     /**
 	       * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3700
 	       * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3700
 	       * @tc.desc    The result of isAnimationReduceEnabled() should be boolean type.
 	       * @tc.size    SmallTest
 	       * @tc.type    User
 	       * @tc.level   Level 0
 	       */
 	     it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3700', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
 	       console.info('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3700');
 	 
 	       accessibility.isAnimationReduceEnabled().then((result) => {
 	         console.info(`AccessibilityApi: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3700 result: ${result}`);
 	         expect(typeof (result)).assertEqual('boolean');
 	         done();
 	       }).catch((err: Error) => {
 	         console.error(`AccessibilityApi: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3700 has error: ${err.code},msg: ${err.message}`);
 	         expect(null).assertFail();
 	         done();
 	       });
 	 
 	     })
 	 
 	     /**
 	       * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3800
 	       * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3800
 	       * @tc.desc    The result of isFlashReminderEnabledSync() should be boolean type.
 	       * @tc.size    SmallTest
 	       * @tc.type    User
 	       * @tc.level   Level 0
 	       */
 	     it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3800', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
 	       console.info('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3800');
 	       try {
 	         let status = accessibility.isFlashReminderEnabledSync();
 	         console.info(`AccessibilityExtensionListSync: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3800 result: ${status}`);
 	         expect(status).assertEqual(false);
 	         done();
 	       } catch (exception) {
 	         console.error('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3800 failed to isFlashReminderEnabledSync because ' + JSON.stringify(exception));
 	         done();
 	       }
 	 
 	     })
 	 
 	     /**
 	       * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3900
 	       * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3900
 	       * @tc.desc    The result of isFlashReminderEnabled() should be boolean type.
 	       * @tc.size    SmallTest
 	       * @tc.type    User
 	       * @tc.level   Level 0
 	       */
 	     it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3900', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
 	       console.info('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3900');
 	 
 	       accessibility.isFlashReminderEnabled().then((result) => {
 	         console.info(`AccessibilityApi: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3900 result: ${result}`);
 	         expect(typeof (result)).assertEqual('boolean');
 	         done();
 	       }).catch((err: Error) => {
 	         console.error(`AccessibilityApi: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_3900 has error: ${err.code},msg: ${err.message}`);
 	         expect(null).assertFail();
 	         done();
 	       });
 	 
 	     })
 	 
 	     /**
 	       * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_4000
 	       * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_4000
 	       * @tc.desc    The result of isAudioMonoEnabledSync() should be boolean type.
 	       * @tc.size    SmallTest
 	       * @tc.type    User
 	       * @tc.level   Level 0
 	       */
 	     it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_4000', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
 	       console.info('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_4000');
 	       try {
 	         let status = accessibility.isAudioMonoEnabledSync();
 	         console.info(`AccessibilityExtensionListSync: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_4000 result: ${status}`);
 	         expect(status).assertEqual(false);
 	         done();
 	       } catch (exception) {
 	         console.error('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_4000 failed to isAudioMonoEnabledSync because ' + JSON.stringify(exception));
 	         done();
 	       }
 	 
 	     })
 	 
 	     /**
 	       * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_4100
 	       * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_4100
 	       * @tc.desc    The result of isAudioMonoEnabled() should be boolean type.
 	       * @tc.size    SmallTest
 	       * @tc.type    User
 	       * @tc.level   Level 0
 	       */
 	     it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_4100', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
 	       console.info('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_4100');
 	 
 	       accessibility.isAudioMonoEnabled().then((result) => {
 	         console.info(`AccessibilityApi: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_4100 result: ${result}`);
 	         expect(typeof (result)).assertEqual('boolean');
 	         done();
 	       }).catch((err: Error) => {
 	         console.error(`AccessibilityApi: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_4100 has error: ${err.code},msg: ${err.message}`);
 	         expect(null).assertFail();
 	         done();
 	       });
 	     })

       /**
 	       * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_4200
 	       * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_4200
 	       * @tc.desc    The result of isSeniorModeEnabled() should be boolean type.
 	       * @tc.size    SmallTest
 	       * @tc.type    User
 	       * @tc.level   Level 0
 	       */
 	     it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_4200', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
 	       console.info('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_4200');
 	 
 	       accessibility.isSeniorModeEnabled().then((result) => {
 	         console.info(`AccessibilityApi: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_4200 result: ${result}`);
 	         expect(typeof (result)).assertEqual('boolean');
           expect(result).assertEqual(false);
 	         done();
 	       }).catch((err: Error) => {
 	         console.error(`AccessibilityApi: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_4200 has error: ${err.code},msg: ${err.message}`);
 	         expect(null).assertFail();
 	         done();
 	       });
 	     })

     /**
 	      * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_1100
 	      * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_1100
 	      * @tc.desc   onTouchModeChange
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL0
 	      */
 	     it('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_1100', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
 	       hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_1100');
 	       let callbackdata = (data:string) => {
 	       }
 	       try {
 	         accessibility.onTouchModeChange(callbackdata);
 	         accessibility.offTouchModeChange(callbackdata);
 	         done();
 	       } catch (error) {
 	         hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_1100 failed');
 	         expect(null).assertFail();
 	         done();
 	       }
 	     })
 	 
 	     /**
 	      * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_1200
 	      * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_1200
 	      * @tc.desc   onAnimationReduceStateChange
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL0
 	      */
 	     it('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_1200', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
 	       hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_1200');
 	       let callbackdata = (data:boolean) => {
 	         expect(data).assertEqual(false);
 	       }
 	       try {
 	         accessibility.onAnimationReduceStateChange(callbackdata);
 	         accessibility.offAnimationReduceStateChange(callbackdata);
 	         done();
 	       } catch (error) {
 	         hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_1200 failed');
 	         expect(null).assertFail();
 	         done();
 	       }
 	     })
 	 
 	     /**
 	      * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_1300
 	      * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_1300
 	      * @tc.desc   onFlashReminderStateChange
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL0
 	      */
 	     it('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_1300', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
 	       hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_1300');
 	       let callbackdata = (data:boolean) => {
 	         expect(data).assertEqual(false);
 	       }
 	       try {
 	         accessibility.onFlashReminderStateChange(callbackdata);
 	         accessibility.offFlashReminderStateChange(callbackdata);
 	         done();
 	       } catch (error) {
 	         hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_1300 failed');
 	         expect(null).assertFail();
 	         done();
 	       }
 	     })
 	 
 	     /**
 	      * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_1400
 	      * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_1400
 	      * @tc.desc   onAudioMonoStateChange
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL0
 	      */
 	     it('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_1400', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
 	       hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_1400');
 	       let callbackdata = (data:boolean) => {
 	         expect(data).assertEqual(false);
 	       }
 	       try {
 	         accessibility.onAudioMonoStateChange(callbackdata);
 	         accessibility.offAudioMonoStateChange(callbackdata);
 	         done();
 	       } catch (error) {
 	         hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_1400 failed');
 	         expect(null).assertFail();
 	         done();
 	       }
 	     })

       /**
 	      * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_1500
 	      * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_1500
 	      * @tc.desc   onSeniorModeStateChange
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL0
 	      */
 	     it('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_1500', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
 	       hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_1500');
 	       let callbackdata = (data:boolean) => {
 	         expect(data).assertEqual(false);
 	       }
 	       try {
 	         accessibility.onSeniorModeStateChange(callbackdata);
 	         accessibility.offSeniorModeStateChange(callbackdata);
 	         done();
 	       } catch (error) {
 	         hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_1500 failed');
 	         expect(null).assertFail();
 	         done();
 	       }
 	     })

  })
}