/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  Size,
  TestType
} from "../../../hypium";
import distributedObject from '@ohos.data.distributedDataObject';
import commonType from '@ohos.data.commonType';
import Context from 'application.BaseContext'

let context: Context | undefined
const TAG = "OBJECTSTORE_TEST";

export default function ObjectStoreJsunitV9Ets(): void {
  describe('ObjectStoreJsunitV9Ets', () => {
    beforeAll(async (done: () => void) => {
      done();
    })

    beforeEach(async (): void => {
      console.info(TAG + 'beforeEach');
      context = context;
    })

    afterEach((): void => {
      console.info(TAG + 'afterEach')
    })

    afterAll((): void => {
      console.info(TAG + 'afterAll')
    })

    console.info(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.name   V9testbindAssetCommunType0100
     * @tc.number SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_bindAssetCommunType_0100
     * @tc.desc   Test CommType Enum Value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('V9testbindAssetCommunType0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* V9testbindAssetCommunType0100 start *************");
        expect(commonType.AssetStatus.ASSET_NORMAL == 0).assertTrue();
        expect(commonType.AssetStatus.ASSET_INSERT == 1).assertTrue();
        expect(commonType.AssetStatus.ASSET_UPDATE == 2).assertTrue();
        expect(commonType.AssetStatus.ASSET_DELETE == 3).assertTrue();
        expect(commonType.AssetStatus.ASSET_ABNORMAL == 4).assertTrue();
        expect(commonType.AssetStatus.ASSET_DOWNLOADING == 5).assertTrue();
        done();
      })

    /**
     * @tc.name   V9testbindAssetCommunType0200
     * @tc.number SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_bindAssetCommunType_0200
     * @tc.desc   Test commonType.Asset,Assets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('V9testbindAssetCommunType0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* V9testbindAssetCommunType0200 start *************");
        let asset1: commonType.Asset = {
          status: commonType.AssetStatus.ASSET_NORMAL,
          name: "1.txt",
          uri: "file://com.example.myapp/data/dir/1.txt",
          path: "/dir/1.txt",
          createTime: "2023/11/30 19:48:00",
          modifyTime: "2023/11/30 20:10:00",
          size: "1",
        }

        let asset2: commonType.Asset = {
          status: commonType.AssetStatus.ASSET_NORMAL,
          name: "2.txt",
          uri: "file://com.example.myapp/data/dir/1.txt",
          path: "/dir/2.txt",
          createTime: "2023/11/30 19:48:00",
          modifyTime: "2023/11/30 20:10:00",
          size: "2",
        }
        let assettype1: commonType.Asset = asset1;
        let assettype2: commonType.Asset = asset2;
        let assetarray11: commonType.Asset[] = [assettype1, assettype2];
        expect(assetarray11[0] == assettype1).assertTrue();
        expect(assetarray11[1] == assettype2).assertTrue();
        done();
      })


    /**
     * @tc.name   V9testbindAssetCommunType0300
     * @tc.number SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_bindAssetCommunType_0300
     * @tc.desc   Test commonType.ValueType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('V9testbindAssetCommunType0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* V9testbindAssetCommunType0300 start *************");
        let asset1: commonType.Asset = {
          status: commonType.AssetStatus.ASSET_NORMAL,
          name: "1.txt",
          uri: "file://com.example.myapp/data/dir/1.txt",
          path: "/dir/1.txt",
          createTime: "2023/11/30 19:48:00",
          modifyTime: "2023/11/30 20:10:00",
          size: "1",
        }

        let asset2: commonType.Asset = {
          status: commonType.AssetStatus.ASSET_NORMAL,
          name: "2.txt",
          uri: "file://com.example.myapp/data/dir/1.txt",
          path: "/dir/2.txt",
          createTime: "2023/11/30 19:48:00",
          modifyTime: "2023/11/30 20:10:00",
          size: "2",
        }
        let valueType1: commonType.ValueType = null;
        let valueType2: commonType.ValueType = 123.0;
        expect(valueType1 == null).assertTrue();
        expect(valueType2 == 123.0).assertTrue();

        let valuesBucket1: commonType.ValuesBucket = {
          "data1": asset1,
          "data2": asset2,
        }
        let valuesBuckettest1: commonType.ValuesBucket = valuesBucket1;
        expect(valuesBuckettest1['data1'] == asset1).assertTrue();
        expect(valuesBuckettest1['data2'] == asset2).assertTrue();
        done();
      })

    /**
     * @tc.name   V9testbindAssetCommunType0400
     * @tc.number SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_bindAssetCommunType_0400
     * @tc.desc   Test BindInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('V9testbindAssetCommunType0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* V9testbindAssetCommunType0400 start *************");
        let asset1: commonType.Asset = {
          status: commonType.AssetStatus.ASSET_NORMAL,
          name: "1.txt",
          uri: "file://com.example.myapp/data/dir/1.txt",
          path: "/dir/1.txt",
          createTime: "2023/11/30 19:48:00",
          modifyTime: "2023/11/30 20:10:00",
          size: "1",
        }
        let bindInfo1: distributedObject.BindInfo = {
          storeName: "store1",
          tableName: "store1",
          primaryKey: {
            "data1": 123.0,
            "data2": "aaa",
            "data3": asset1,
            "data4": 101.5,
          },
          field: "field1",
          assetName: "asset1"
        }
        let bindInfotest1: distributedObject.BindInfo = bindInfo1;

        expect(bindInfotest1.storeName == "store1").assertTrue();
        expect(bindInfotest1.tableName == "store1").assertTrue();
        expect(bindInfotest1.primaryKey['data1'] == 123).assertTrue();
        expect(bindInfotest1.primaryKey['data3'] == asset1).assertTrue();
        expect(bindInfotest1.field == "field1").assertTrue();
        expect(bindInfotest1.assetName == "asset1").assertTrue();
        done();
      })
    console.info(TAG + "*************Unit Test End*************");
  })
}
