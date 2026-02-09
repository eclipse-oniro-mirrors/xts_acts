/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size,Level} from '@ohos/hypium'
import unifiedDataChannel from '@ohos.data.unifiedDataChannel';
import uniformTypeDescriptor from '@ohos.data.uniformTypeDescriptor';
import image from '@ohos.multimedia.image';
import Want from '@ohos.app.ability.Want';
import { AVCastPickerState } from '@ohos.multimedia.avCastPickerParam';


const KEY_TEST_ELEMENT = 'TestKey';
const VALUE_TEST_ELEMENT = 'TestValue';
const TAG = '[ttt]'

function func(inputStr:string) {
  console.info(TAG, 'execute func');
  let text = new unifiedDataChannel.Text();
  text.details = {
    Key: inputStr + KEY_TEST_ELEMENT,
    Value: inputStr + VALUE_TEST_ELEMENT,
  };
  let data = new unifiedDataChannel.UnifiedData(text);
  data.properties.tag = "FileTag";
  return data;
}

export default function UDMFSupportClipboardApiTest() {
  describe('UDMFSupportClipboardApiTest', () => {

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0100
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0100
     * @tc.desc   unifiedDataChannel properties test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0100';
      console.info(TAG, 'start');
      let text = new unifiedDataChannel.Text();
      let unifiedDatas = new unifiedDataChannel.UnifiedData();
      unifiedDatas.addRecord(text);
      let properties = unifiedDatas.properties;
      expect(typeof properties).assertEqual('object');
      expect(typeof properties.extras).assertEqual('object');
      expect(typeof properties.tag).assertEqual('string');
      expect(typeof properties.timestamp).assertEqual('object');
      expect(typeof properties.shareOptions).assertEqual('number');
      expect(typeof properties.getDelayData).assertEqual('undefined');
      console.info(TAG, 'start' + typeof properties.shareOptions);
      console.info(TAG, 'end');
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0200
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0200
     * @tc.desc   SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0200';
      console.info(TAG, 'start');
      let text = new unifiedDataChannel.Text();
      let unifiedData = new unifiedDataChannel.UnifiedData(text);
      let properties = new unifiedDataChannel.UnifiedDataProperties();

      expect(properties.shareOptions).assertEqual(unifiedDataChannel.ShareOptions.CROSS_APP);
      properties.shareOptions = unifiedDataChannel.ShareOptions.IN_APP;
      unifiedData.properties = properties;
      expect(unifiedData.properties.shareOptions).assertEqual(unifiedDataChannel.ShareOptions.IN_APP);
      unifiedData.properties.shareOptions = unifiedDataChannel.ShareOptions.CROSS_APP;
      expect(unifiedData.properties.shareOptions).assertEqual(unifiedDataChannel.ShareOptions.CROSS_APP);

      expect(unifiedData.properties.tag).assertEqual('');
      unifiedData.properties.tag = 'DataTag';
      expect(unifiedData.properties.tag).assertEqual('DataTag');

      expect(Object.keys(unifiedData.properties.extras).length).assertEqual(0);
      console.info(TAG, 'start' + expect(Object.keys(unifiedData.properties.extras).length).assertEqual(0));
      properties.extras = {
        person: {
          f_name: 'John',
          l_name: 'Doe',
          age: 25
        }
      };
      expect(Object.keys(unifiedData.properties.extras).length).assertEqual(1);
      console.info(TAG, 'start' + JSON.stringify(unifiedData.properties.extras));
      if (unifiedData.properties.extras != undefined){
        expect(JSON.stringify(unifiedData.properties.extras.person)).assertEqual(JSON.stringify({
          "age": 25, "f_name": "John", "l_name": "Doe"
        }));
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0300
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0300
     * @tc.desc   unifiedDataChannel properties test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'UnifiedDataPropertiesTest003';
      console.info(TAG, 'start');
      let text = new unifiedDataChannel.Text();
      let unifiedData = new unifiedDataChannel.UnifiedData(text);



      unifiedData.properties.getDelayData = func;
      const data = unifiedData.properties.getDelayData('inputTest');
      let records = data.getRecords();
      expect(records.length).assertEqual(1);
      for (let i = 0; i < records.length; i++) {
        if (records[i].getType() == uniformTypeDescriptor.UniformDataType.TEXT) {
          let text = records[i] as unifiedDataChannel.Text;
          if (text.details != undefined) {
            expect(text.details.Key).assertEqual('inputTest' + KEY_TEST_ELEMENT);
            expect(text.details.Value).assertEqual('inputTest' + VALUE_TEST_ELEMENT);
            expect(data.properties.tag).assertEqual('FileTag');
          }
        }
      }
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0400
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0400
     * @tc.desc   unifiedDataChannel properties test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0400';
      console.info(TAG, 'start');
      const textType = 'general.text';
      const plaintextType = 'general.plain-text';
      const htmlType = 'general.html'

      let text = new unifiedDataChannel.Text();
      let unifiedData = new unifiedDataChannel.UnifiedData(text);
      expect(unifiedData.hasType(textType)).assertEqual(true);
      expect(unifiedData.hasType(htmlType)).assertEqual(false);
      expect(unifiedData.hasType(plaintextType)).assertEqual(false);
      let types = unifiedData.getTypes();
      expect(types.length).assertEqual(1);
      expect(types[0]).assertEqual(textType);

      let html = new unifiedDataChannel.HTML();
      unifiedData.addRecord(html);
      expect(unifiedData.hasType(textType)).assertEqual(true);
      expect(unifiedData.hasType(htmlType)).assertEqual(true);
      expect(unifiedData.hasType(plaintextType)).assertEqual(false);
      types = unifiedData.getTypes();
      expect(types.length).assertEqual(2);
      expect(types[0]).assertEqual(textType);
      expect(types[1]).assertEqual(htmlType);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0500
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0500
     * @tc.desc   unifiedDataChannel properties test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0500';
      console.info(TAG, 'start');

      const dataUri = new ArrayBuffer(256);
      let view1 = new Uint32Array(dataUri);
      view1[0] = 123456;
      let record1 = new unifiedDataChannel.UnifiedRecord('general.message', dataUri);
      const data1 = record1.getValue() as ArrayBuffer;
      console.info(TAG, 'start' + data1);
      expect(data1.byteLength).assertEqual(256);
      let view2 = new Uint32Array(data1);
      expect(view1[0]).assertEqual(view2[0]);

      let record2 = new unifiedDataChannel.UnifiedRecord('general.message', "https://www.xxx.com/");
      const data2 = record2.getValue();
      expect(data2).assertEqual("https://www.xxx.com/");

      let record3 = new unifiedDataChannel.UnifiedRecord('general.message', 8899);
      const data3 = record3.getValue();
      expect(data3).assertEqual(8899);

      let record4 = new unifiedDataChannel.UnifiedRecord('general.message', 8899.7788);
      const data4 = record4.getValue();
      expect(data4).assertEqual(8899.7788);

      const buffer = new ArrayBuffer(128);
      const opt: image.InitializationOptions = {
        size: {
          height: 5, width: 5
        },
        pixelFormat: 3,
        editable: true,
        alphaType: 1,
        scaleMode: 1,
      };
      const pixelMap = await image.createPixelMap(buffer, opt);
      let record5 = new unifiedDataChannel.UnifiedRecord('openharmony.pixel-map', pixelMap);
      let data5 = record5.getValue() as image.PixelMap;
      data5.getImageInfo().then((imageInfo) => {
        expect(imageInfo.size.height).assertEqual(opt.size.height);
        expect(imageInfo.pixelFormat).assertEqual(opt.pixelFormat);
      });

      const wantText: Want = {
        bundleName: 'com.example.myapplication1',
        abilityName: 'com.example.myapplication1.MainAbility',
      };
      let record6 = new unifiedDataChannel.UnifiedRecord('openharmony.want', wantText);
      const data6 = record6.getValue() as Want;
      expect(data6.bundleName).assertEqual(wantText.bundleName);
      expect(data6.abilityName).assertEqual(wantText.abilityName);
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0600
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0600
     * @tc.desc   unifiedDataChannel properties test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0600';
      console.info(TAG, 'start');

      const dataUri = new ArrayBuffer(256);
      let view1 = new Uint32Array(dataUri);
      view1[0] = 123456;
      let record1 = new unifiedDataChannel.UnifiedRecord('general.message', dataUri);

      let unifiedData = new unifiedDataChannel.UnifiedData(record1);
      let records = unifiedData.getRecords();
      expect(records.length).assertEqual(1);

      let record2 = new unifiedDataChannel.UnifiedRecord('general.message', "https://www.xxx.com/");
      unifiedData.addRecord(record2);
      let record3 = new unifiedDataChannel.UnifiedRecord('general.message', 8899);
      unifiedData.addRecord(record3);
      let record4 = new unifiedDataChannel.UnifiedRecord('general.message', 8899.7788);
      unifiedData.addRecord(record4);
      const buffer = new ArrayBuffer(128);
      const opt: image.InitializationOptions = {
        size: {
          height: 5, width: 5
        },
        pixelFormat: 3,
        editable: true,
        alphaType: 1,
        scaleMode: 1,
      };
      const pixelMap = await image.createPixelMap(buffer, opt);
      let record5 = new unifiedDataChannel.UnifiedRecord('openharmony.pixel-map', pixelMap);
      unifiedData.addRecord(record5);
      const wantText: Want = {
        bundleName: 'com.example.myapplication1',
        abilityName: 'com.example.myapplication1.MainAbility',
      };
      let record6 = new unifiedDataChannel.UnifiedRecord('openharmony.want', wantText);
      unifiedData.addRecord(record6);

      records = unifiedData.getRecords();
      expect(records.length).assertEqual(6);
      const data1 = records[0].getValue() as ArrayBuffer;
      expect(data1.byteLength).assertEqual(256);
      let view2 = new Uint32Array(data1);
      expect(view1[0]).assertEqual(view2[0]);
      const data2 = records[1].getValue();
      expect(data2).assertEqual("https://www.xxx.com/");
      const data3 = records[2].getValue();
      expect(data3).assertEqual(8899);
      const data4 = records[3].getValue();
      expect(data4).assertEqual(8899.7788);
      const data5 = records[4].getValue() as image.PixelMap;
      data5.getImageInfo().then((imageInfo) => {
        expect(imageInfo.size.height).assertEqual(opt.size.height);
        expect(imageInfo.pixelFormat).assertEqual(opt.pixelFormat);
      });
      const data6 = records[5].getValue() as Want;
      expect(data6.bundleName).assertEqual(wantText.bundleName);
      expect(data6.abilityName).assertEqual(wantText.abilityName);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0700
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0700
     * @tc.desc   unifiedDataChannel properties test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0700';
      console.info(TAG, 'start');

      const dataUri = new ArrayBuffer(256);
      let view1 = new Uint32Array(dataUri);
      view1[0] = 123456;
      let record1 = new unifiedDataChannel.UnifiedRecord('general.text', dataUri);
      let unifiedData = new unifiedDataChannel.UnifiedData(record1);
      let record2 = new unifiedDataChannel.UnifiedRecord('general.text', "https://www.xxx.com/");
      unifiedData.addRecord(record2);
      let record3 = new unifiedDataChannel.UnifiedRecord('general.text', 8899);
      unifiedData.addRecord(record3);
      let record4 = new unifiedDataChannel.UnifiedRecord('general.text', 8899.7788);
      unifiedData.addRecord(record4);

      let records = unifiedData.getRecords();
      expect(records.length).assertEqual(4);
      const data1 = records[0].getValue() as ArrayBuffer;
      expect(data1.byteLength).assertEqual(256);
      let view2 = new Uint32Array(data1);
      expect(view1[0]).assertEqual(view2[0]);
      const data2 = records[1].getValue();
      expect(data2).assertEqual("https://www.xxx.com/");
      const data3 = records[2].getValue();
      expect(data3).assertEqual(8899);
      const data4 = records[3].getValue();
      expect(data4).assertEqual(8899.7788);
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0800
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0800
     * @tc.desc   unifiedDataChannel properties test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0800';
      console.info(TAG, 'start');

      const dataUri = new ArrayBuffer(256);
      let view1 = new Uint32Array(dataUri);
      view1[0] = 123456;
      let record1 = new unifiedDataChannel.UnifiedRecord('otherType', dataUri);
      let unifiedData = new unifiedDataChannel.UnifiedData(record1);
      let record2 = new unifiedDataChannel.UnifiedRecord('otherType', "https://www.xxx.com/");
      unifiedData.addRecord(record2);
      let record3 = new unifiedDataChannel.UnifiedRecord('otherType', 8899);
      unifiedData.addRecord(record3);
      let record4 = new unifiedDataChannel.UnifiedRecord('otherType', 8899.7788);
      unifiedData.addRecord(record4);

      let records = unifiedData.getRecords();
      expect(records.length).assertEqual(4);
      const data1 = records[0].getValue() as ArrayBuffer;
      expect(data1.byteLength).assertEqual(256);
      let view2 = new Uint32Array(data1);
      expect(view1[0]).assertEqual(view2[0]);
      const data2 = records[1].getValue();
      expect(data2).assertEqual("https://www.xxx.com/");
      const data3 = records[2].getValue();
      expect(data3).assertEqual(8899);
      const data4 = records[3].getValue();
      expect(data4).assertEqual(8899.7788);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0900
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0900
     * @tc.desc   unifiedDataChannel properties test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0900';
      console.info(TAG, 'start');
      let obj: unifiedDataChannel.ValueType = {
        foo: "bar", baz: 42
      };
      let record1 = new unifiedDataChannel.UnifiedRecord('otherType', false);
      let unifiedData = new unifiedDataChannel.UnifiedData(record1);
      let record2 = new unifiedDataChannel.UnifiedRecord('otherType', undefined);
      unifiedData.addRecord(record2);
      let record3 = new unifiedDataChannel.UnifiedRecord('otherType', null);
      unifiedData.addRecord(record3);
      let record4 = new unifiedDataChannel.UnifiedRecord('otherType', true);
      unifiedData.addRecord(record4);
      let record5 = new unifiedDataChannel.UnifiedRecord('otherType', obj);
      unifiedData.addRecord(record5);
      let records = unifiedData.getRecords();
      expect(records.length).assertEqual(5);
      const data1 = records[0].getValue() as Boolean;
      expect(data1).assertEqual(false);
      const data2 = records[1].getValue();
      expect(data2).assertEqual(undefined);
      const data3 = records[2].getValue();
      expect(data3).assertEqual(null);
      const data4 = records[3].getValue() as Boolean;
      expect(data4).assertEqual(true);
      const data5 = records[4].getValue() as object;
      expect(data5["foo"]).assertEqual("bar");
      expect(data5["baz"]).assertEqual(42);
    });
  
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_1000
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_1000
     * @tc.desc   addRecord  test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_1000 start');
      let unifiedData = new unifiedDataChannel.UnifiedData();
      try {
        unifiedData.addRecord(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual('401');
      }
      console.log("SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_1000 end");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_1100
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_1100
     * @tc.desc   hasType test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_1100 start');
      let text = new unifiedDataChannel.Text();
      let unifiedData = new unifiedDataChannel.UnifiedData(text);
      try {
        unifiedData.hasType(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual('401');
      }
      console.log("SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_1100 end");
    });
  })
}