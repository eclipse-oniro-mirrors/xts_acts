import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
import Rect from '@ohos.application.AccessibilityExtensionAbility';
import accessibility from '@ohos.accessibility'
import { Resource } from 'global.resource';


class Rect {
        left: number;
        top: number;
        width: number;
        height: number;
}

type CaptionsFontFamily = 'default' | 'monospacedSerif' | 'serif' | 'monospacedSansSerif' | 'sansSerif' | 'casual' | 'cursive' | 'smallCapitals';
type CaptionsFontEdgeType = 'none' | 'raised' | 'depressed' | 'uniform' | 'dropShadow';

let result: boolean = false;
let domain: int = 0x0000;
let tag: string = 'testTag';
const bundleName = 'com.huawei.hmos.cardistributedassist';
const triggerAction : accessibility.Action = 'accessibilityFocus';
const eventType : accessibility.EventType = 'accessibilityFocus';

export default function abilityTest() {
  describe("AccessibleCheckAbilityStaticTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0600
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0600
     * @tc.desc   The result of isOpenTouchGuideSync() should be boolean type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0600', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0600');
      try {
        let status = accessibility.isOpenTouchGuideSync();
        hilog.info(domain, tag, `AccessibilityApi: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0600 result: ${status}`);
        expect(typeof (status)).assertEqual('boolean');
        done();
      } catch (error) {
        hilog.error(domain, tag,'SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0600 failed to isOpenTouchGuideSync because ');
        expect(null).assertFail();
        done();
      }
    })

     /**
      * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0700
      * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0700
      * @tc.desc    The result of isScreenReaderOpenSync() should be boolean type.
      * @tc.size    SmallTest
      * @tc.type    User
      * @tc.level   Level 0
      */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0700', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0700');
      try {
        let status = accessibility.isScreenReaderOpenSync();
        console.info(`AccessibilityExtensionListSync: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0700 result: ${status}`);
        expect(status).assertEqual(false);
        done();
      } catch (exception) {
        console.error('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0700 failed to AccessibilityExtensionListSync because ' + JSON.stringify(exception));
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
        accessibility.onTouchGuideStateChange(callbackdata);
        done();
      } catch (error) {
        hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0200 failed');
        expect(null).assertFail();
        done();
      }
    })

   })
 }