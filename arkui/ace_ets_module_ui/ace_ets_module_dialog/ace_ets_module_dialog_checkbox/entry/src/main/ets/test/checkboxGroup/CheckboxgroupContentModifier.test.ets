/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import router from '@ohos.router';
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import { BusinessError } from '@ohos.base';
import Utils from '../../MainAbility/common/Utils'
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';

export default function CheckboxgroupContentModifier() {
  describe('CheckboxgroupContentModifier', () => {
    beforeEach(async (done: Function) => {
      console.info('CheckboxgroupContentModifier beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/checkboxGroup/CheckboxgroupContentModifier',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get CheckboxgroupContentModifier state success ' + JSON.stringify(pages));
        if (!('CheckboxgroupContentModifier' == pages.name)) {
          console.info('get CheckboxgroupContentModifier state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push CheckboxgroupContentModifier page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push CheckboxgroupContentModifier page error: ' + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('CheckboxgroupContentModifier after each called');
    });
    /**
     * @tc.name   CheckboxgroupContentModifier_001
     * @tc.number CheckboxgroupContentModifier_001
     * @tc.desc   test CheckboxgroupContentModifier_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CheckboxgroupContentModifier_001', Level.LEVEL0, async (done: Function) => {
      console.info('[CheckboxgroupContentModifier_001] START');
      let strJson = getInspectorByKey('CheckboxgroupContentModifier01');
      let obj: Record<string, ESObject>= JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info('[CheckboxgroupContentModifier_001] obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('selectedColor:#ffff0000');
      console.info('[CheckboxgroupContentModifier_001] END');
      done();
    });
    /**
     * @tc.name   CheckboxgroupContentModifier_002
     * @tc.number CheckboxgroupContentModifier_002
     * @tc.desc   test CheckboxgroupContentModifier_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CheckboxgroupContentModifier_002', Level.LEVEL0, async (done: Function) => {
      console.info('[CheckboxgroupContentModifier_002] START');
      let strJson = getInspectorByKey('CheckboxgroupContentModifier_pentagon');
      let obj: Record<string, ESObject>= JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info('[CheckboxgroupContentModifier_002] obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.width).assertEqual('100.00vp');
      expect(obj.$attrs.height).assertEqual('100.00vp');
      expect(obj.$attrs.fillOpacity).assertEqual('0.000000');
      console.info('[CheckboxgroupContentModifier_002] END');
      done();
    });
    /**
     * @tc.name   CheckboxgroupContentModifier_003
     * @tc.number CheckboxgroupContentModifier_003
     * @tc.desc   test CheckboxgroupContentModifier_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CheckboxgroupContentModifier_003', Level.LEVEL0, async (done: Function) => {
      console.info('[CheckboxgroupContentModifier_003] START');
      let strJson = getInspectorByKey('CheckboxgroupContentModifier_triangle1');
      let obj: Record<string, ESObject>= JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info('[CheckboxgroupContentModifier_003] obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.width).assertEqual('10.00vp');
      expect(obj.$attrs.height).assertEqual('10.00vp');
      expect(obj.$attrs.visibility).assertEqual("Visibility.Hidden");
      expect(obj.$attrs.fill).assertEqual('#FFFF0000');
      expect(obj.$attrs.stroke).assertEqual('#FFFF0000');
      let left = JSON.stringify(JSON.parse(obj.$attrs.margin).left)
      expect(left).assertEqual('\"10.00vp\"');
      let top = JSON.stringify(JSON.parse(obj.$attrs.margin).top)
      expect(top).assertEqual('\"10.00vp\"');
      console.info('[CheckboxgroupContentModifier_003] END');
      done();
    });
    /**
     * @tc.name   CheckboxgroupContentModifier_004
     * @tc.number CheckboxgroupContentModifier_004
     * @tc.desc   test CheckboxgroupContentModifier_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CheckboxgroupContentModifier_004', Level.LEVEL0, async (done: Function) => {
      console.info('[CheckboxgroupContentModifier_004] START');
      let strJson = getInspectorByKey('CheckboxgroupContentModifier_triangle2');
      let obj: Record<string, ESObject>= JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info('[CheckboxgroupContentModifier_004] obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.width).assertEqual('10.00vp');
      expect(obj.$attrs.height).assertEqual('10.00vp');
      expect(obj.$attrs.visibility).assertEqual("Visibility.Hidden");
      expect(obj.$attrs.fill).assertEqual('#FFFFFF00');
      expect(obj.$attrs.stroke).assertEqual('#FFFF0000');
      let left = JSON.stringify(JSON.parse(obj.$attrs.margin).left)
      expect(left).assertEqual('\"10.00vp\"');
      let top = JSON.stringify(JSON.parse(obj.$attrs.margin).top)
      expect(top).assertEqual('\"10.00vp\"');
      console.info('[CheckboxgroupContentModifier_004] END');
      done();
    });
    /**
     * @tc.name   CheckboxgroupContentModifier_005
     * @tc.number CheckboxgroupContentModifier_005
     * @tc.desc   test CheckboxgroupContentModifier_005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CheckboxgroupContentModifier_005', Level.LEVEL0, async (done: Function) => {
      console.info('[CheckboxgroupContentModifier_005] START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "colorValue": Color.Yellow,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 66,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[CheckboxgroupContentModifier_005] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[CheckboxgroupContentModifier_005] change component data error: ' + (err as BusinessError).message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('CheckboxgroupContentModifier01');
      let obj: Record<string, ESObject>= JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info('[CheckboxgroupContentModifier_005] obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('selectedColor:#ffffff00');
      console.info('[CheckboxgroupContentModifier_005] END');
      done();
    });
    /**
     * @tc.name   CheckboxgroupContentModifier_006
     * @tc.number CheckboxgroupContentModifier_006
     * @tc.desc   test CheckboxgroupContentModifier_006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CheckboxgroupContentModifier_006', Level.LEVEL0, async (done: Function) => {
      console.info('[CheckboxgroupContentModifier_006] START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selectState": 1,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 69,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[CheckboxgroupContentModifier_006] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[CheckboxgroupContentModifier_006] change component data error: ' + (err as BusinessError).message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('CheckboxgroupContentModifier_triangle1');
      let obj: Record<string, ESObject>= JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info('[CheckboxgroupContentModifier_006] obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.visibility).assertEqual("Visibility.Visible");
      console.info('[CheckboxgroupContentModifier_006] END');
      done();
    });
    /**
     * @tc.name   CheckboxgroupContentModifier_007
     * @tc.number CheckboxgroupContentModifier_007
     * @tc.desc   test CheckboxgroupContentModifier_007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CheckboxgroupContentModifier_007', Level.LEVEL0, async (done: Function) => {
      console.info('[CheckboxgroupContentModifier_007] START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selectState": 2,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 69,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[CheckboxgroupContentModifier_007] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[CheckboxgroupContentModifier_007] change component data error: ' + (err as BusinessError).message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('CheckboxgroupContentModifier_triangle2');
      let obj: Record<string, ESObject>= JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info('[CheckboxgroupContentModifier_007] obj is: ' + JSON.stringify(obj));
      console.info('[CheckboxgroupContentModifier_007] visibility is: ' + obj.$attrs.visibility);
      expect(obj.$attrs.visibility).assertEqual("Visibility.Visible");
      console.info('[CheckboxgroupContentModifier_007] END');
      done();
    });
    /**
     * @tc.name   CheckboxgroupContentModifier_008
     * @tc.number CheckboxgroupContentModifier_008
     * @tc.desc   test CheckboxgroupContentModifier_008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CheckboxgroupContentModifier_008', Level.LEVEL0, async (done: Function) => {
      console.info('[CheckboxgroupContentModifier_008] START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selectState": 3,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 69,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[CheckboxgroupContentModifier_008] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[CheckboxgroupContentModifier_008] change component data error: ' + (err as BusinessError).message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('CheckboxgroupContentModifier_triangle2');
      let obj: Record<string, ESObject>= JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info('[CheckboxgroupContentModifier_008] obj is: ' + JSON.stringify(obj));
      console.info('[CheckboxgroupContentModifier_008] visibility is: ' + obj.$attrs.visibility);
      expect(obj.$attrs.visibility).assertEqual("Visibility.Visible");
      console.info('[CheckboxgroupContentModifier_008] END');
      done();
    });
    /**
     * @tc.name   CheckboxgroupContentModifier_009
     * @tc.number CheckboxgroupContentModifier_009
     * @tc.desc   test CheckboxgroupContentModifier_009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CheckboxgroupContentModifier_009', Level.LEVEL0, async (done: Function) => {
      console.info('[CheckboxgroupContentModifier_009] START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selectState": 4,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 69,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[CheckboxgroupContentModifier_009] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[CheckboxgroupContentModifier_009] change component data error: ' + (err as BusinessError).message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('CheckboxgroupContentModifier_triangle2');
      let obj: Record<string, ESObject>= JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info('[CheckboxgroupContentModifier_009] obj is: ' + JSON.stringify(obj));
      console.info('[CheckboxgroupContentModifier_009] visibility is: ' + obj.$attrs.visibility);
      expect(obj.$attrs.visibility).assertEqual("Visibility.Hidden");
      console.info('[CheckboxgroupContentModifier_009] END');
      done();
    });
    /**
     * @tc.name   CheckboxgroupContentModifier_010
     * @tc.number CheckboxgroupContentModifier_010
     * @tc.desc   test CheckboxgroupContentModifier_010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CheckboxgroupContentModifier_010', Level.LEVEL0, async (done: Function) => {
      console.info('[CheckboxgroupContentModifier_010] START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selectState": 4,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 69,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[CheckboxgroupContentModifier_010] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[CheckboxgroupContentModifier_010] change component data error: ' + (err as BusinessError).message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('CheckboxgroupContentModifier_triangle1');
      let obj: Record<string, ESObject>= JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info('[CheckboxgroupContentModifier_010] obj is: ' + JSON.stringify(obj));
      console.info('[CheckboxgroupContentModifier_010] visibility is: ' + obj.$attrs.visibility);
      expect(obj.$attrs.visibility).assertEqual("Visibility.Hidden");
      console.info('[CheckboxgroupContentModifier_010] END');
      done();
    });
    /**
     * @tc.name   CheckboxgroupContentModifier_011
     * @tc.number CheckboxgroupContentModifier_011
     * @tc.desc   test CheckboxgroupContentModifier_011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CheckboxgroupContentModifier_011', Level.LEVEL0, async (done: Function) => {
      console.info('[CheckboxgroupContentModifier_011] START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "CheckboxGroupStyle": 'undefined',
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 67,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[CheckboxgroupContentModifier_011] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[CheckboxgroupContentModifier_011] change component data error: ' + (err as BusinessError).message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('CheckboxgroupContentModifier_CheckboxGroup');
      let obj: Record<string, ESObject>= JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info('[CheckboxgroupContentModifier_011] obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.contentModifier == undefined).assertTrue();
      console.info('[CheckboxgroupContentModifier_011] END');
      done();
    });
    /**
     * @tc.name   CheckboxgroupContentModifier_012
     * @tc.number CheckboxgroupContentModifier_012
     * @tc.desc   test CheckboxgroupContentModifier_012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CheckboxgroupContentModifier_012', Level.LEVEL0, async (done: Function) => {
      console.info('[CheckboxgroupContentModifier_012] START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "CheckboxGroupStyle": 'null',
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 68,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[CheckboxgroupContentModifier_012] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[CheckboxgroupContentModifier_012] change component data error: ' + (err as BusinessError).message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('CheckboxgroupContentModifier_CheckboxGroup');
      let obj: Record<string, ESObject>= JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info('[CheckboxgroupContentModifier_012] obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.contentModifier == null).assertTrue();
      console.info('[CheckboxgroupContentModifier_012] END');
      done();
    });
    /**
     * @tc.name   CheckboxgroupContentModifier_013
     * @tc.number CheckboxgroupContentModifier_013
     * @tc.desc   test CheckboxgroupContentModifier_013
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CheckboxgroupContentModifier_013', Level.LEVEL0, async (done: Function) => {
      console.info('[CheckboxgroupContentModifier_013] START');
      await Utils.sleep(1000);
      try {
        let checkboxGroupName: CheckboxGroupOptions = { group: 'checkboxGroup12345' };
        let eventData: events_emitter.EventData = {
          data: {
            "groupName": checkboxGroupName,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 70,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[CheckboxgroupContentModifier_013] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[CheckboxgroupContentModifier_013] change component data error: ' + (err as BusinessError).message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('CheckboxgroupContentModifier02');
      let obj: Record<string, ESObject>= JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info('[CheckboxgroupContentModifier_013] obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('checkBoxGroupName:checkboxGroup12345');
      console.info('[CheckboxgroupContentModifier_013] END');
      done();
    });
    /**
     * @tc.name   CheckboxgroupContentModifier_014
     * @tc.number CheckboxgroupContentModifier_014
     * @tc.desc   test CheckboxgroupContentModifier_014
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CheckboxgroupContentModifier_014', Level.LEVEL0, async (done: Function) => {
      console.info('[CheckboxgroupContentModifier_014] START');

      await Utils.sleep(1000);
      let driver = Driver.create();
  
      let component = await driver.findComponent(ON.id('checkboxgroup_shape'));
      await component.click();
      
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('CheckboxgroupContentModifier_triangle1');
      let obj: Record<string, ESObject>= JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info('[CheckboxgroupContentModifier_014] obj is: ' + JSON.stringify(obj));
      console.info('[CheckboxgroupContentModifier_014] visibility is: ' + obj.$attrs.visibility);
      expect(obj.$attrs.visibility).assertEqual("Visibility.Visible");
      console.info('[CheckboxgroupContentModifier_014] END');
      done();
    });
  })
}