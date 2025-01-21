// @ts-nocheck
/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@system.router';
import events_emitter from '@ohos.events.emitter'
import Utils from '../Utils';

export default function ImageAnimatorJsunit() {
  describe('ImageAnimatorTest', function () {
    beforeEach(async function (done) {
      console.info("image beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/ImageAnimatorPage',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get image state pages: " + JSON.stringify(pages));
        if (!("ImageAnimatorPage" == pages.name)) {
          console.info("get ImageAnimatorPage pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("ImageAnimatorPage page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("ImageAnimatorPage page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("ImageAnimatorPage after each called");
    })
    /**
     * @tc.number  ImageAnimator-Images01
     * @tc.name    Test the Images property of the ImageAnimator component
     * @tc.desc    set the Images property value is array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0     
     */
    it('ImageAnimator-Images01', 0, async function (done) {
      let tagName = 'ImageAnimator-Images01';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)

      let defaultValue = [
        {
          src: '/pages/assert/c1.png'
        },
        {
          src: '/pages/assert/c2.png',
        }
      ]
      let strJson = getInspectorByKey('keyImageAnimator_images');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      console.info(JSON.stringify(defaultValue));
      console.info("defaultValue[0]:" + JSON.stringify(defaultValue[0]));
      console.info("obj.$attrs.images:" + JSON.stringify(obj.$attrs.images));
      let imagesArr = JSON.parse(obj.$attrs.images)
      console.info("obj.$attrs.images[0].src:" + JSON.stringify(imagesArr[0].src));
      expect(imagesArr[0].src).assertEqual(defaultValue[0].src);
      console.info("obj.$attrs.images[1].src:" + JSON.stringify(imagesArr[1].src));
      expect(imagesArr[1].src).assertEqual(defaultValue[1].src);
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number  ImageAnimator-FillMode02
     * @tc.name    Test the FillMode property of the ImageAnimator component
     * @tc.desc    set the FillMode property value is  FillMode.Forwards
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0     
     */
    it('ImageAnimator-FillMode02', 0, async function (done) {
      let tagName = 'ImageAnimator-FillMode02';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keyImageAnimator_images');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('ImageAnimator');
      expect(obj.$attrs.fillMode).assertEqual('FillMode.None');

      try {
        let eventData1 = {
          data: {
            "fillmodeValue": FillMode.Forwards,
          }
        }
        let innerEvent1 = {
          eventId: 101,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent1, eventData1);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJson1 = getInspectorByKey('keyImageAnimator_images');
      let obj1 = JSON.parse(strJson1);
      console.info('[' + tagName + '] component obj1 is: ' + JSON.stringify(obj1));
      expect(obj1.$type).assertEqual('ImageAnimator');
      expect(obj1.$attrs.fillMode).assertEqual('FillMode.Forwards');
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number  ImageAnimator-State03
     * @tc.name    Test the State property of the ImageAnimator component
     * @tc.desc    set the State property value is  AnimationStatus.Initial
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0     
     */
    it('ImageAnimator-State03', 0, async function (done) {
      let tagName = 'ImageAnimator-State03';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keyImageAnimator_images');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('ImageAnimator');

      console.log('ImageAnimatorr-obj-state:' + obj.$attrs.state);
      expect(obj.$attrs.state).assertEqual('AnimationStatus.Running');

      try {
        let eventData1 = {
          data: {
            "stateValue": AnimationStatus.Initial,
          }
        }
        let innerEvent1 = {
          eventId: 102,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent1, eventData1);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJson1 = getInspectorByKey('keyImageAnimator_images');
      let obj1 = JSON.parse(strJson1);
      console.info('[' + tagName + '] component obj1 is: ' + JSON.stringify(obj1));
      expect(obj1.$type).assertEqual('ImageAnimator');
      console.log('ImageAnimator-obj1-state:' + obj1.$attrs.state);
      expect(obj1.$attrs.state).assertEqual('AnimationStatus.Initial');
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number  ImageAnimator-Duration04
     * @tc.name    Test the Duration property of the ImageAnimator component
     * @tc.desc    set the Duration property value is  5000
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0     
     */
    it('ImageAnimator-Duration04', 0, async function (done) {
      let tagName = 'ImageAnimator-Duration04';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keyImageAnimator_images');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('ImageAnimator');
      console.log('ImageAnimator-obj-duration:' + obj.$attrs.duration);
      expect(obj.$attrs.duration).assertEqual('3000');

      try {
        let eventData1 = {
          data: {
            "durationValue": 5000,
          }
        }
        let innerEvent1 = {
          eventId: 103,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent1, eventData1);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJson1 = getInspectorByKey('keyImageAnimator_images');
      let obj1 = JSON.parse(strJson1);
      console.info('[' + tagName + '] component obj1 is: ' + JSON.stringify(obj1));
      expect(obj1.$type).assertEqual('ImageAnimator');
      console.log('ImageAnimator-obj1-duration:' + obj1.$attrs.duration);
      expect(obj1.$attrs.duration).assertEqual('5000');
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number  ImageAnimator-Reverse05
     * @tc.name    Test the Reverse property of the ImageAnimator component
     * @tc.desc    set the Reverse property value is  false
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0     
     */
    it('ImageAnimator-Reverse05', 0, async function (done) {
      let tagName = 'ImageAnimator-Reverse05';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keyImageAnimator_images');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('ImageAnimator');
      expect(obj.$attrs.reverse).assertEqual('true');

      try {
        let eventData1 = {
          data: {
            "reverseValue": false,
          }
        }
        let innerEvent1 = {
          eventId: 104,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent1, eventData1);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJson1 = getInspectorByKey('keyImageAnimator_images');
      let obj1 = JSON.parse(strJson1);
      console.info('[' + tagName + '] component obj1 is: ' + JSON.stringify(obj1));
      expect(obj1.$type).assertEqual('ImageAnimator');
      expect(obj1.$attrs.reverse).assertEqual('false');
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number  ImageAnimator-FixedSize06
     * @tc.name    Test the FixedSize property of the ImageAnimator component
     * @tc.desc    set the FixedSize property value is  false
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0     
     */
    it('ImageAnimator-FixedSize06', 0, async function (done) {
      let tagName = 'ImageAnimator-FixedSize06';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keyImageAnimator_images');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('ImageAnimator');
      expect(obj.$attrs.fixedSize).assertEqual('true');

      try {
        let eventData1 = {
          data: {
            "fixedSizeValue": false,
          }
        }
        let innerEvent1 = {
          eventId: 105,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent1, eventData1);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJson1 = getInspectorByKey('keyImageAnimator_images');
      let obj1 = JSON.parse(strJson1);
      console.info('[' + tagName + '] component obj1 is: ' + JSON.stringify(obj1));
      expect(obj1.$type).assertEqual('ImageAnimator');
      expect(obj1.$attrs.fixedSize).assertEqual('false');
      console.info('[' + tagName + '] END ===========================');
      done();
    });

   /**
     * @tc.number  ImageAnimator-Iterations07
     * @tc.name    Test the Iterations property of the ImageAnimator component
     * @tc.desc    set the Iterations property value is  2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0     
     */
    it('ImageAnimator-Iterations07', 0, async function (done) {
      let tagName = 'ImageAnimator-Iterations07';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keyImageAnimator_images');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('ImageAnimator');
      expect(obj.$attrs.iterations).assertEqual('-1');

      try {
        let eventData1 = {
          data: {
            "iterationsValue": 2,
          }
        }
        let innerEvent1 = {
          eventId: 106,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent1, eventData1);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJson1 = getInspectorByKey('keyImageAnimator_images');
      let obj1 = JSON.parse(strJson1);
      console.info('[' + tagName + '] component obj1 is: ' + JSON.stringify(obj1));
      expect(obj1.$type).assertEqual('ImageAnimator');
      expect(obj1.$attrs.iterations).assertEqual('2');
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
