/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { ON, BY, Driver, UiDriver } from '@kit.TestKit';
import { router } from '@kit.ArkUI';
import Utils from '../../MainAbility/common/Utils';

const SLEEP_TIME = 1000;

export default function badgeTest() {
  describe('badgeTest', () => {
    beforeEach(async (done: Function) => {
      console.info('BadgeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/badge/badgeResource',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get badgeResourceTest state pages:' + JSON.stringify(pages));
        if (!('badgeResource' === pages.name)) {
          console.info('get badgeResourceTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push badgeResourceTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push badgeResourceTest page error:' + err);
      }
      console.info('badgeResourceTest beforeEach end');
      done();
    });

    /**
     * @tc.name   badgeResourceTest_001
     * @tc.number badgeResourceTest_001
     * @tc.desc   FrameNode Badge Input Normal FontSize: $r('app.string.fontSize_10'),return value: 10.00vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('badgeResourceTest_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('badgeResourceTest_001 START');
      let strJson = getInspectorByKey('key_ badge_001');
      let obj: ESObject = JSON.parse(strJson);
      let style: ESObject = JSON.parse(obj.$attrs.style);
      console.log("[badgeResourceTest_001] style.fontSize" + style.fontSize);
      expect(style.fontSize).assertEqual('10.00vp');
      console.info('[badgeResourceTest_001] END');
      done();
    });

    /**
     * @tc.name   badgeResourceTest_002
     * @tc.number badgeResourceTest_002
     * @tc.desc   FrameNode Badge Input Normal FontWeight: $r('app.string.fontWeight_normal'),return value: FontWeight.Normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('badgeResourceTest_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('badgeResourceTest_002 START');
      let strJson = getInspectorByKey('key_ badge_002');
      let obj: ESObject = JSON.parse(strJson);
      let style: ESObject = JSON.parse(obj.$attrs.style);
      console.info('[badgeResourceTest_002] style.fontWeight is: ' + style.fontWeight);
      expect(style.fontWeight).assertEqual('FontWeight.Normal');
      console.info('[badgeResourceTest_002] END');
      done();
    });

    /**
     * @tc.name   badgeResourceTest_003
     * @tc.number badgeResourceTest_003
     * @tc.desc   FrameNode Badge Input Normal value: $r('app.string.text_string'),return value: text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('badgeResourceTest_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('badgeResourceTest_003 START');
      let strJson = getInspectorByKey('key_ badge_003');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[badgeResourceTest_003] obj is: ' + obj.$attrs.value);
      expect(obj.$attrs.value).assertEqual('text');
      console.info('[badgeResourceTest_003] END');
      done();
    });
    
    /**
     * @tc.name   badgeResourceTest_004
     * @tc.number badgeResourceTest_004
     * @tc.desc   FrameNode Badge Input Normal badgeSize: $r('app.string.size_30'),return value: 30.00px
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('badgeResourceTest_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('badgeResourceTest_004 START');
      let strJson = getInspectorByKey('key_ badge_004');
      let obj: ESObject = JSON.parse(strJson);
      let style: ESObject = JSON.parse(obj.$attrs.style);
      console.info('[badgeResourceTest_004] style.badgeSize is: ' + style.badgeSize);
      expect(style.badgeSize).assertEqual('30.00px');
      console.info('[badgeResourceTest_004] END');
      done();
    });

    /**
     * @tc.name   badgeResourceTest_005
     * @tc.number badgeResourceTest_005
     * @tc.desc   FrameNode Badge Input Abnormal fontSize: $r('app.media.icon'),return value: 10.00vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('badgeResourceTest_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('badgeResourceTest_005 START');
      let strJson = getInspectorByKey('key_ badge_005');
      let obj: ESObject = JSON.parse(strJson);
      let style: ESObject = JSON.parse(obj.$attrs.style);
      console.info('[badgeResourceTest_005] style.fontSize is: ' + style.fontSize);
      expect(style.fontSize).assertEqual('10.00vp');
      console.info('[badgeResourceTest_005] END');
      done();
    });

    /**
     * @tc.name   badgeResourceTest_006
     * @tc.number badgeResourceTest_006
     * @tc.desc   FrameNode Badge Input Abnormal fontWeight: $r('app.media.icon'),return value: FontWeight.Normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('badgeResourceTest_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('badgeResourceTest_006 START');
      let strJson = getInspectorByKey('key_ badge_006');
      let obj: ESObject = JSON.parse(strJson);
      let style: ESObject = JSON.parse(obj.$attrs.style);
      console.info('[badgeResourceTest_006] style.fontWeight is: ' + style.fontWeight);
      expect(style.fontWeight).assertEqual('FontWeight.Normal');
      console.info('[badgeResourceTest_006] END');
      done();
    });

    /**
     * @tc.name   badgeResourceTest_007
     * @tc.number badgeResourceTest_007
     * @tc.desc   FrameNode Badge Input Abnormal value: $r('app.media.icon'),return value: ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('badgeResourceTest_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('badgeResourceTest_007 START');
      let strJson = getInspectorByKey('key_ badge_007');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[badgeResourceTest_007] obj is: ' + obj.$attrs.value);
      expect(obj.$attrs.value).assertEqual('');
      console.info('[badgeResourceTest_007] END');
      done();
    });
    
    /**
     * @tc.name   badgeResourceTest_008
     * @tc.number badgeResourceTest_008
     * @tc.desc   FrameNode Badge Input Abnormal badgeSize: $r('app.media.icon'),return value: 16.00vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('badgeResourceTest_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('badgeResourceTest_008 START');
      let strJson = getInspectorByKey('key_ badge_008');
      let obj: ESObject = JSON.parse(strJson);
      let style: ESObject = JSON.parse(obj.$attrs.style);
      await Utils.sleep(SLEEP_TIME);
      console.info('[badgeResourceTest_008] style.badgeSize is: ' + style.badgeSize);
      expect(style.badgeSize).assertEqual('16.00vp');
      console.info('[badgeResourceTest_008] END');
      done();
    });
    

    /**
     * @tc.name   badgeResourceTest_011
     * @tc.number badgeResourceTest_011
     * @tc.desc   Badge Input Normal FontSize: $r('app.string.fontSize_10'),return value: 10.00vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('badgeResourceTest_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('badgeResourceTest_011 START');
      let strJson = getInspectorByKey('key_ badge_011');
      let obj: ESObject = JSON.parse(strJson);
      let style: ESObject = JSON.parse(obj.$attrs.style);
      console.info('[badgeResourceTest_011] style.fontSize is: ' + style.fontSize);
      expect(style.fontSize).assertEqual('10.00vp');
      console.info('[badgeResourceTest_011] END');
      done();
    });

    /**
     * @tc.name   badgeResourceTest_012
     * @tc.number badgeResourceTest_012
     * @tc.desc   Badge Input Normal FontWeight: $r('app.string.fontWeight_normal'),return value: FontWeight.Normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('badgeResourceTest_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('badgeResourceTest_012 START');
      let strJson = getInspectorByKey('key_ badge_012');
      let obj: ESObject = JSON.parse(strJson);
      let style: ESObject = JSON.parse(obj.$attrs.style);
      console.info('[badgeResourceTest_012] style.fontWeight is: ' + style.fontWeight);
      expect(style.fontWeight).assertEqual('FontWeight.Normal');
      console.info('[badgeResourceTest_012] END');
      done();
    });

    /**
     * @tc.name   badgeResourceTest_013
     * @tc.number badgeResourceTest_013
     * @tc.desc   Badge Input Normal value: $r('app.string.text_string'),return value: text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('badgeResourceTest_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('badgeResourceTest_013 START');
      let strJson = getInspectorByKey('key_ badge_013');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[badgeResourceTest_013] obj is: ' + obj.$attrs.value);
      expect(obj.$attrs.value).assertEqual('text');
      console.info('[badgeResourceTest_013] END');
      done();
    });
    
    /**
     * @tc.name   badgeResourceTest_014
     * @tc.number badgeResourceTest_014
     * @tc.desc   Badge Input Normal badgeSize: $r('app.string.size_30'),return value: 30.00px
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('badgeResourceTest_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('badgeResourceTest_014 START');
      let strJson = getInspectorByKey('key_ badge_014');
      let obj: ESObject = JSON.parse(strJson);
      let style: ESObject = JSON.parse(obj.$attrs.style);
      console.info('[badgeResourceTest_014] style.badgeSize is: ' + style.badgeSize);
      expect(style.badgeSize).assertEqual('30.00px');
      console.info('[badgeResourceTest_014] END');
      done();
    });

    /**
     * @tc.name   badgeResourceTest_015
     * @tc.number badgeResourceTest_015
     * @tc.desc   Badge Input Abnormal fontSize: $r('app.media.icon'),return value: 10.00vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('badgeResourceTest_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('badgeResourceTest_015 START');
      let strJson = getInspectorByKey('key_ badge_015');
      let obj: ESObject = JSON.parse(strJson);
      let style: ESObject = JSON.parse(obj.$attrs.style);
      console.info('[badgeResourceTest_015] style.fontSize is: ' + style.fontSize);
      expect(style.fontSize).assertEqual('10.00vp');
      console.info('[badgeResourceTest_015] END');
      done();
    });

    /**
     * @tc.name   badgeResourceTest_016
     * @tc.number badgeResourceTest_016
     * @tc.desc   Badge Input Abnormal fontWeight: $r('app.media.icon'),return value: FontWeight.Normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('badgeResourceTest_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('badgeResourceTest_016 START');
      let strJson = getInspectorByKey('key_ badge_016');
      let obj: ESObject = JSON.parse(strJson);
      let style: ESObject = JSON.parse(obj.$attrs.style);
      console.info('[badgeResourceTest_016] style.fontWeight is: ' + style.fontWeight);
      expect(style.fontWeight).assertEqual('FontWeight.Normal');
      console.info('[badgeResourceTest_016] END');
      done();
    });

    /**
     * @tc.name   badgeResourceTest_017
     * @tc.number badgeResourceTest_017
     * @tc.desc   Badge Input Abnormal value: $r('app.media.icon'),return value: ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('badgeResourceTest_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('badgeResourceTest_017 START');
      let strJson = getInspectorByKey('key_ badge_017');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[badgeResourceTest_017] obj is: ' + obj.$attrs.value);
      expect(obj.$attrs.value).assertEqual('');
      console.info('[badgeResourceTest_017] END');
      done();
    });
    
    /**
     * @tc.name   badgeResourceTest_018
     * @tc.number badgeResourceTest_018
     * @tc.desc   Badge Input Abnormal badgeSize: $r('app.media.icon'),return value: 16.00vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('badgeResourceTest_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('badgeResourceTest_018 START');
      let strJson = getInspectorByKey('key_ badge_018');
      let obj: ESObject = JSON.parse(strJson);
      let style: ESObject = JSON.parse(obj.$attrs.style);
      console.info('[badgeResourceTest_018] style.badgeSize is: ' + style.badgeSize);
      expect(style.badgeSize).assertEqual('16.00vp');
      console.info('[badgeResourceTest_018] END');
      done();
    });
  })
}
