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
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { router } from '@kit.ArkUI';
import Utils from '../../MainAbility/common/Utils';


export default function ImageOnErrorCodeTest() {
  describe('ImageOnErrorCodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info('ImageOnErrorCodeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageError/ImageErrorCode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ImageOnErrorCodeTest state pages:' + JSON.stringify(pages));
        if (!('ImageErrorCode' === pages.name)) {
          console.info('get ImageOnErrorCodeTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push ImageOnErrorCodeTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ImageOnErrorCodeTest page error:' + err);
      }
      console.info('ImageOnErrorCodeTest beforeEach end');
      done();
    });

    /**
     * @tc.name   ImageOnErrorCodeTest_001
     * @tc.number ImageOnErrorCodeTest_001
     * @tc.desc   To test the ImageOnError code message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageOnErrorCodeTest_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[ImageOnErrorCodeTest_001] START');
      await Utils.sleep(1500);
      let strJson = getInspectorByKey('101000msg');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageOnErrorCodeTest_001] obj.$attrs.content is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('unknown source type.');

      let strJson1 = getInspectorByKey('101000');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[ImageOnErrorCodeTest_001] obj1.$attrs.content is: ' + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('101000');
      console.info('[ImageOnErrorCodeTest_001] END');
      done();
    });

    /**
     * @tc.name   ImageOnErrorCodeTest_002
     * @tc.number ImageOnErrorCodeTest_002
     * @tc.desc   To test the ImageOnError code message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageOnErrorCodeTest_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[ImageOnErrorCodeTest_002] START');
      await Utils.sleep(1500);
      let strJson = getInspectorByKey('102030msg');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageOnErrorCodeTest_002] obj.$attrs.content is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('wrong code format.');

      let strJson1 = getInspectorByKey('102030');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[ImageOnErrorCodeTest_002] obj1.$attrs.content is: ' + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('102030');
      console.info('[ImageOnErrorCodeTest_002] END');
      done();
    });

    /**
     * @tc.name   ImageOnErrorCodeTest_003
     * @tc.number ImageOnErrorCodeTest_003
     * @tc.desc   To test the ImageOnError code message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageOnErrorCodeTest_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[ImageOnErrorCodeTest_003] START');
      await Utils.sleep(1500);
      let strJson = getInspectorByKey('102031msg');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageOnErrorCodeTest_003] obj.$attrs.content is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('decode base64 image failed.');

      let strJson1 = getInspectorByKey('102031');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[ImageOnErrorCodeTest_003] obj1.$attrs.content is: ' + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('102031');
      console.info('[ImageOnErrorCodeTest_003] END');
      done();
    });

    /**
     * @tc.name   ImageOnErrorCodeTest_004
     * @tc.number ImageOnErrorCodeTest_004
     * @tc.desc   To test the ImageOnError code message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageOnErrorCodeTest_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[ImageOnErrorCodeTest_004] START');
      await Utils.sleep(1500);
      let strJson = getInspectorByKey('102050msg');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageOnErrorCodeTest_004] obj.$attrs.content is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('path is too long.');

      let strJson1 = getInspectorByKey('102050');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[ImageOnErrorCodeTest_004] obj1.$attrs.content is: ' + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('102050');
      console.info('[ImageOnErrorCodeTest_004] END');
      done();
    });

    /**
     * @tc.name   ImageOnErrorCodeTest_005
     * @tc.number ImageOnErrorCodeTest_005
     * @tc.desc   To test the ImageOnError code message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageOnErrorCodeTest_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[ImageOnErrorCodeTest_005] START');
      await Utils.sleep(1500);
      let strJson = getInspectorByKey('102051msg');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageOnErrorCodeTest_005] obj.$attrs.content is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('read data failed.');

      let strJson1 = getInspectorByKey('102051');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[ImageOnErrorCodeTest_005] obj1.$attrs.content is: ' + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('102051');
      console.info('[ImageOnErrorCodeTest_005] END');
      done();
    });

    /**
     * @tc.name   ImageOnErrorCodeTest_006
     * @tc.number ImageOnErrorCodeTest_006
     * @tc.desc   To test the ImageOnError code message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageOnErrorCodeTest_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[ImageOnErrorCodeTest_006] START');
      await Utils.sleep(1500);
      let strJson = getInspectorByKey('102070msg');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageOnErrorCodeTest_006] obj.$attrs.content is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('get image data by name failed.');

      let strJson1 = getInspectorByKey('102070');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[ImageOnErrorCodeTest_006] obj1.$attrs.content is: ' + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('102070');
      console.info('[ImageOnErrorCodeTest_006] END');
      done();
    });

    /**
     * @tc.name   ImageOnErrorCodeTest_007
     * @tc.number ImageOnErrorCodeTest_007
     * @tc.desc   To test the ImageOnError code message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageOnErrorCodeTest_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[ImageOnErrorCodeTest_007] START');
      await Utils.sleep(1500);
      let strJson = getInspectorByKey('102072msg');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageOnErrorCodeTest_007] obj.$attrs.content is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('uri is invalid.');

      let strJson1 = getInspectorByKey('102072');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[ImageOnErrorCodeTest_007] obj1.$attrs.content is: ' + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('102072');
      console.info('[ImageOnErrorCodeTest_007] END');
      done();
    });

    /**
     * @tc.name   ImageOnErrorCodeTest_008
     * @tc.number ImageOnErrorCodeTest_008
     * @tc.desc   To test the ImageOnError code message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageOnErrorCodeTest_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[ImageOnErrorCodeTest_008] START');
      await Utils.sleep(1500);
      let strJson = getInspectorByKey('102091msg');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageOnErrorCodeTest_008] obj.$attrs.content is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('get asset failed.');

      let strJson1 = getInspectorByKey('102091');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[ImageOnErrorCodeTest_008] obj1.$attrs.content is: ' + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('102091');
      console.info('[ImageOnErrorCodeTest_008] END');
      done();
    });

    /**
     * @tc.name   ImageOnErrorCodeTest_009
     * @tc.number ImageOnErrorCodeTest_009
     * @tc.desc   To test the ImageOnError code message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageOnErrorCodeTest_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[ImageOnErrorCodeTest_009] START');
      await Utils.sleep(1500);
      let strJson = getInspectorByKey('102110msg');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageOnErrorCodeTest_009] obj.$attrs.content is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('open file failed.');

      let strJson1 = getInspectorByKey('102110');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[ImageOnErrorCodeTest_009] obj1.$attrs.content is: ' + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('102110');
      console.info('[ImageOnErrorCodeTest_009] END');
      done();
    });

    /**
     * @tc.name   ImageOnErrorCodeTest_010
     * @tc.number ImageOnErrorCodeTest_010
     * @tc.desc   To test the ImageOnError code message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageOnErrorCodeTest_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[ImageOnErrorCodeTest_010] START');
      await Utils.sleep(1500);
      let strJson = getInspectorByKey('102130msg');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageOnErrorCodeTest_010] obj.$attrs.content is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('decoded data is empty.');

      let strJson1 = getInspectorByKey('102130');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[ImageOnErrorCodeTest_010] obj1.$attrs.content is: ' + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('102130');
      console.info('[ImageOnErrorCodeTest_010] END');
      done();
    });

    /**
     * @tc.name   ImageOnErrorCodeTest_011
     * @tc.number ImageOnErrorCodeTest_011
     * @tc.desc   To test the ImageOnError code message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageOnErrorCodeTest_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[ImageOnErrorCodeTest_011] START');
      await Utils.sleep(13000);
      let strJson = getInspectorByKey('102131msg');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageOnErrorCodeTest_011] obj.$attrs.content is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('load shared memory image data timeout.');

      let strJson1 = getInspectorByKey('102131');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[ImageOnErrorCodeTest_011] obj1.$attrs.content is: ' + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('102131');
      console.info('[ImageOnErrorCodeTest_011] END');
      done();
    });

    /**
     * @tc.name   ImageOnErrorCodeTest_012
     * @tc.number ImageOnErrorCodeTest_012
     * @tc.desc   To test the ImageOnError code message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageOnErrorCodeTest_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[ImageOnErrorCodeTest_012] START');
      await Utils.sleep(13000);
      let strJson = getInspectorByKey('103100msg');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageOnErrorCodeTest_012] obj.$attrs.content is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('make svg dom failed.');

      let strJson1 = getInspectorByKey('103100');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[ImageOnErrorCodeTest_012] obj1.$attrs.content is: ' + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('103100');
      console.info('[ImageOnErrorCodeTest_012] END');
      done();
    });

    /**
     * @tc.name   ImageOnErrorCodeTest_013
     * @tc.number ImageOnErrorCodeTest_013
     * @tc.desc   To test the ImageOnError code message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageOnErrorCodeTest_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[ImageOnErrorCodeTest_013] START');
      await Utils.sleep(13000);
      let strJson = getInspectorByKey('103200msg');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageOnErrorCodeTest_013] obj.$attrs.content is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('image data size is invalid.');

      let strJson1 = getInspectorByKey('103200');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[ImageOnErrorCodeTest_013] obj1.$attrs.content is: ' + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('103200');
      console.info('[ImageOnErrorCodeTest_013] END');
      done();
    });
  })
}