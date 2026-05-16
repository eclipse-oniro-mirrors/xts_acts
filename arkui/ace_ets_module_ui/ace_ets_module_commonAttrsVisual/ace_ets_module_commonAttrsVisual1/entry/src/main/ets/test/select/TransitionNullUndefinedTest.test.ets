/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium';
import { router } from '@kit.ArkUI';
import Utils from '../../MainAbility/common/Utils';
import { Driver, ON, } from '@ohos.UiTest';

export default function TransitionNullUndefinedTest() {
  describe('TransitionNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info('TransitionNullUndefinedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/select/TransitionNullUndefinedTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TransitionNullUndefinedTest state pages:' + JSON.stringify(pages));
        if (!('TransitionNullUndefinedTest' == pages.name)) {
          console.info('get TransitionNullUndefinedTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push TransitionNullUndefinedTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TransitionNullUndefinedTest page error:' + err);
      }
      console.info('TransitionNullUndefinedTest beforeEach end');
      done();
    });

    /**
     * @tc.name   TransitionNullUndefinedTest_001
     * @tc.number TransitionNullUndefinedTest_001
     * @tc.desc   To test theTransitionEffect.rotate empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TransitionNullUndefinedTest_001', Level.LEVEL2, async (done: Function) => {
      await Utils.sleep(1000);
      console.log('TransitionNullUndefinedTest_001 START')
      let strJson = getInspectorByKey('TransitionEffectRotateEmpty');
      let obj: ESObject = JSON.parse(strJson);
      console.info("TransitionNullUndefinedTest_001 obj is: " + JSON.stringify(obj));
      console.info("[TransitionNullUndefinedTest_001] type: " + obj.$type);
      expect(obj.$type).assertEqual('Image')
      console.log('TransitionNullUndefinedTest_001 END')
      done();
    });

    /**
     * @tc.name   TransitionNullUndefinedTest_002
     * @tc.number TransitionNullUndefinedTest_002
     * @tc.desc   To test theTransitionEffect.rotate Null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TransitionNullUndefinedTest_002', Level.LEVEL2, async (done: Function) => {
      await Utils.sleep(1000);
      console.log('TransitionNullUndefinedTest_002 START')
      let strJson = getInspectorByKey('TransitionEffectRotateNull');
      let obj: ESObject = JSON.parse(strJson);
      console.info("TransitionNullUndefinedTest_002 obj is: " + JSON.stringify(obj));
      console.info("[TransitionNullUndefinedTest_002] type: " + obj.$type);
      expect(obj.$type).assertEqual('Image')
      console.log('TransitionNullUndefinedTest_002 END')
      done();
    });

    /**
     * @tc.name   TransitionNullUndefinedTest_003
     * @tc.number TransitionNullUndefinedTest_003
     * @tc.desc   To test theTransitionEffect.rotate undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TransitionNullUndefinedTest_003', Level.LEVEL2, async (done: Function) => {
      await Utils.sleep(1000);
      console.log('TransitionNullUndefinedTest_003 START')
      let strJson = getInspectorByKey('TransitionEffectRotateUndefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info("TransitionNullUndefinedTest_003 obj is: " + JSON.stringify(obj));
      console.info("[TransitionNullUndefinedTest_003] type: " + obj.$type);
      expect(obj.$type).assertEqual('Image')
      console.log('TransitionNullUndefinedTest_003 END')
      done();
    });

    /**
     * @tc.name   TransitionNullUndefinedTest_004
     * @tc.number TransitionNullUndefinedTest_004
     * @tc.desc   To test theTransitionEffect.scale empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TransitionNullUndefinedTest_004', Level.LEVEL2, async (done: Function) => {
      await Utils.sleep(1000);
      console.log('TransitionNullUndefinedTest_004 START')
      let strJson = getInspectorByKey('TransitionEffectScaleEmpty');
      let obj: ESObject = JSON.parse(strJson);
      console.info("TransitionNullUndefinedTest_004 obj is: " + JSON.stringify(obj));
      console.info("[TransitionNullUndefinedTest_004] type: " + obj.$type);
      expect(obj.$type).assertEqual('Image')
      console.log('TransitionNullUndefinedTest_004 END')
      done();
    });

    /**
     * @tc.name   TransitionNullUndefinedTest_005
     * @tc.number TransitionNullUndefinedTest_005
     * @tc.desc   To test theTransitionEffect.scale null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TransitionNullUndefinedTest_005', Level.LEVEL2, async (done: Function) => {
      await Utils.sleep(1000);
      console.log('TransitionNullUndefinedTest_005 START')
      let strJson = getInspectorByKey('TransitionEffectScaleNull');
      let obj: ESObject = JSON.parse(strJson);
      console.info("TransitionNullUndefinedTest_005 obj is: " + JSON.stringify(obj));
      console.info("[TransitionNullUndefinedTest_005] type: " + obj.$type);
      expect(obj.$type).assertEqual('Image')
      console.log('TransitionNullUndefinedTest_005 END')
      done();
    });

    /**
     * @tc.name   TransitionNullUndefinedTest_006
     * @tc.number TransitionNullUndefinedTest_006
     * @tc.desc   To test theTransitionEffect.scale undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TransitionNullUndefinedTest_006', Level.LEVEL2, async (done: Function) => {
      await Utils.sleep(1000);
      console.log('TransitionNullUndefinedTest_006 START')
      let strJson = getInspectorByKey('TransitionEffectScaleUndefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info("TransitionNullUndefinedTest_006 obj is: " + JSON.stringify(obj));
      console.info("[TransitionNullUndefinedTest_006] type: " + obj.$type);
      expect(obj.$type).assertEqual('Image')
      console.log('TransitionNullUndefinedTest_006 END')
      done();
    });

    /**
     * @tc.name   TransitionNullUndefinedTest_007
     * @tc.number TransitionNullUndefinedTest_007
     * @tc.desc   To test theTransitionEffect.opacity null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TransitionNullUndefinedTest_007', Level.LEVEL2, async (done: Function) => {
      await Utils.sleep(1000);
      console.log('TransitionNullUndefinedTest_007 START')
      let strJson = getInspectorByKey('TransitionEffectOpacityNull');
      let obj: ESObject = JSON.parse(strJson);
      console.info("TransitionNullUndefinedTest_007 obj is: " + JSON.stringify(obj));
      console.info("[TransitionNullUndefinedTest_007] type: " + obj.$type);
      expect(obj.$type).assertEqual('Image')
      console.log('TransitionNullUndefinedTest_007 END')
      done();
    });

    /**
     * @tc.name   TransitionNullUndefinedTest_008
     * @tc.number TransitionNullUndefinedTest_008
     * @tc.desc   To test theTransitionEffect.opacity undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TransitionNullUndefinedTest_008', Level.LEVEL2, async (done: Function) => {
      await Utils.sleep(1000);
      console.log('TransitionNullUndefinedTest_008 START')
      let strJson = getInspectorByKey('TransitionEffectOpacityUndefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info("TransitionNullUndefinedTest_008 obj is: " + JSON.stringify(obj));
      console.info("[TransitionNullUndefinedTest_008] type: " + obj.$type);
      expect(obj.$type).assertEqual('Image')
      console.log('TransitionNullUndefinedTest_008 END')
      done();
    });

    /**
     * @tc.name   TransitionNullUndefinedTest_009
     * @tc.number TransitionNullUndefinedTest_009
     * @tc.desc   To test theTransitionEffect.asymmetric null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TransitionNullUndefinedTest_009', Level.LEVEL2, async (done: Function) => {
      await Utils.sleep(1000);
      console.log('TransitionNullUndefinedTest_009 START')
      let strJson = getInspectorByKey('TransitionEffectAsymmetricNull');
      let obj: ESObject = JSON.parse(strJson);
      console.info("TransitionNullUndefinedTest_009 obj is: " + JSON.stringify(obj));
      console.info("[TransitionNullUndefinedTest_009] type: " + obj.$type);
      expect(obj.$type).assertEqual('Image')
      console.log('TransitionNullUndefinedTest_009 END')
      done();
    });

    /**
     * @tc.name   TransitionNullUndefinedTest_010
     * @tc.number TransitionNullUndefinedTest_010
     * @tc.desc   To test theTransitionEffect.asymmetric undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TransitionNullUndefinedTest_010', Level.LEVEL2, async (done: Function) => {
      await Utils.sleep(1000);
      console.log('TransitionNullUndefinedTest_010 START')
      let strJson = getInspectorByKey('TransitionEffectAsymmetricUndefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info("TransitionNullUndefinedTest_010 obj is: " + JSON.stringify(obj));
      console.info("[TransitionNullUndefinedTest_010] type: " + obj.$type);
      expect(obj.$type).assertEqual('Image')
      console.log('TransitionNullUndefinedTest_010 END')
      done();
    });


    /**
     * @tc.name   TransitionNullUndefinedTest_011
     * @tc.number TransitionNullUndefinedTest_011
     * @tc.desc   To test theTransitionEffect.animation null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TransitionNullUndefinedTest_011', Level.LEVEL2, async (done: Function) => {
      await Utils.sleep(1000);
      console.log('TransitionNullUndefinedTest_011 START')
      let strJson = getInspectorByKey('TransitionEffectAnimationNull');
      let obj: ESObject = JSON.parse(strJson);
      console.info("TransitionNullUndefinedTest_011 obj is: " + JSON.stringify(obj));
      console.info("[TransitionNullUndefinedTest_011] type: " + obj.$type);
      expect(obj.$type).assertEqual('Image')
      console.log('TransitionNullUndefinedTest_011 END')
      done();
    });

    /**
     * @tc.name   TransitionNullUndefinedTest_012
     * @tc.number TransitionNullUndefinedTest_012
     * @tc.desc   To test theTransitionEffect.animation undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TransitionNullUndefinedTest_012', Level.LEVEL2, async (done: Function) => {
      await Utils.sleep(1000);
      console.log('TransitionNullUndefinedTest_012 START')
      let strJson = getInspectorByKey('TransitionEffectAnimationUndefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info("TransitionNullUndefinedTest_012 obj is: " + JSON.stringify(obj));
      console.info("[TransitionNullUndefinedTest_012] type: " + obj.$type);
      expect(obj.$type).assertEqual('Image')
      console.log('TransitionNullUndefinedTest_012 END')
      done();
    });

    /**
     * @tc.name   TransitionNullUndefinedTest_013
     * @tc.number TransitionNullUndefinedTest_013
     * @tc.desc   To test theTransitionEffect.animation  curve:empty  finishCallbackType:LOGICALLY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TransitionNullUndefinedTest_013', Level.LEVEL2, async (done: Function) => {
      await Utils.sleep(1000);
      console.log('TransitionNullUndefinedTest_013 START')
      let strJson = getInspectorByKey('TransitionEffectAnimationEmpty1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("TransitionNullUndefinedTest_013 obj is: " + JSON.stringify(obj));
      console.info("[TransitionNullUndefinedTest_013] type: " + obj.$type);
      expect(obj.$type).assertEqual('Image')
      console.log('TransitionNullUndefinedTest_013 END')
      done();
    });

    /**
     * @tc.name   TransitionNullUndefinedTest_014
     * @tc.number TransitionNullUndefinedTest_014
     * @tc.desc   To test theTransitionEffect.animation  curve:empty  finishCallbackType:REMOVED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TransitionNullUndefinedTest_014', Level.LEVEL2, async (done: Function) => {
      await Utils.sleep(1000);
      console.log('TransitionNullUndefinedTest_014 START')
      let strJson = getInspectorByKey('TransitionEffectAnimationEmpty2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("TransitionNullUndefinedTest_014 obj is: " + JSON.stringify(obj));
      console.info("[TransitionNullUndefinedTest_014] type: " + obj.$type);
      expect(obj.$type).assertEqual('Image')
      console.log('TransitionNullUndefinedTest_014 END')
      done();
    });

    /**
     * @tc.name   TransitionNullUndefinedTest_015
     * @tc.number TransitionNullUndefinedTest_015
     * @tc.desc   To test theTransitionEffect.combine null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TransitionNullUndefinedTest_015', Level.LEVEL2, async (done: Function) => {
      await Utils.sleep(1000);
      console.log('TransitionNullUndefinedTest_015 START')
      let strJson = getInspectorByKey('TransitionEffectCombineNull');
      let obj: ESObject = JSON.parse(strJson);
      console.info("TransitionNullUndefinedTest_015 obj is: " + JSON.stringify(obj));
      console.info("[TransitionNullUndefinedTest_015] type: " + obj.$type);
      expect(obj.$type).assertEqual('Image')
      console.log('TransitionNullUndefinedTest_015 END')
      done();
    });

    /**
     * @tc.name   TransitionNullUndefinedTest_016
     * @tc.number TransitionNullUndefinedTest_016
     * @tc.desc   To test theTransitionEffect.combine undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TransitionNullUndefinedTest_016', Level.LEVEL2, async (done: Function) => {
      await Utils.sleep(1000);
      console.log('TransitionNullUndefinedTest_016 START')
      let strJson = getInspectorByKey('TransitionEffectCombineUndefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info("TransitionNullUndefinedTest_016 obj is: " + JSON.stringify(obj));
      console.info("[TransitionNullUndefinedTest_016] type: " + obj.$type);
      expect(obj.$type).assertEqual('Image')
      console.log('TransitionNullUndefinedTest_016 END')
      done();
    });

    /**
     * @tc.name   TransitionNullUndefinedTest_017
     * @tc.number TransitionNullUndefinedTest_017
     * @tc.desc   To test theTransitionEffect.asymmetric undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TransitionNullUndefinedTest_017', Level.LEVEL2, async (done: Function) => {
      await Utils.sleep(1000);
      console.log('TransitionNullUndefinedTest_017 START')
      let strJson = getInspectorByKey('TransitionEffectAsymmetricUndefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info("TransitionNullUndefinedTest_017 obj is: " + JSON.stringify(obj));
      console.info("[TransitionNullUndefinedTest_017] type: " + obj.$type);
      expect(obj.$type).assertEqual('Image')
      console.log('TransitionNullUndefinedTest_017 END')
      done();
    });

  })
}