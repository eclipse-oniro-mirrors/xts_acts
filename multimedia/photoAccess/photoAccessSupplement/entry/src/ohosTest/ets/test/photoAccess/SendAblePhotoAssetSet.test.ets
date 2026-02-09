/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import dataSharePredicates from '@ohos.data.dataSharePredicates';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import sendablePhotoAccessHelper from '@ohos.file.sendablePhotoAccessHelper'
import { describe, it, expect, beforeAll, Level } from "@ohos/hypium";
import {
  sleep,
  getPermission,
  driveFn
} from '../common'

import common from '@ohos.app.ability.common';

const TAG = "photoAssetSetSuppTest: ";



export default function sendAbleSetTest() {
  describe('sendAbleSetTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let globalContext: common.UIAbilityContext = AppStorage.get('globalContext') as common.UIAbilityContext;
    let sendablePhAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(globalContext);

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await sleep(1000);
      await driveFn();
    });



    const sendAblePhotoAssetSetTest = async (done: Function, testName: string, member: string, value: string, callback: (err: number) => void) => {
      console.info(TAG, testName);
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOption: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> =
          await sendablePhAccessHelper.getAssets(fetchOption);
        let photoAsset: sendablePhotoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        photoAsset.set(member, value);
        let newTitle = photoAsset.get(member);
        console.info(TAG,'photoAsset.set value: ' + value + 'get value: ' + newTitle);
        expect(newTitle).assertEqual(value);
        done();
      } catch (err) {
        console.error(TAG,`${testName} release failed. error: ${err.code}, ${err.message}`);
        callback(err.code);
        done();
      }
    }

    /**
     * @tc.name   SEND_ABLE_PHOTO_ASSET_HELPER_SET_0001
     * @tc.number SEND_ABLE_PHOTO_ASSET_HELPER_SET_0001
     * @tc.desc   set photo title success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_PHOTO_ASSET_HELPER_SET_0001', Level.LEVEL0, async (done: Function) => {
      let member = '';
      await sendAblePhotoAssetSetTest(done, 'SEND_ABLE_PHOTO_ASSET_HELPER_SET_0001',member,'newTitle',(errCode) => {
        expect(errCode == 14000014 ).assertTrue();
      })
    });

    /**
     * @tc.name   SEND_ABLE_PHOTO_ASSET_HELPER_SET_0002
     * @tc.number SEND_ABLE_PHOTO_ASSET_HELPER_SET_0002
     * @tc.desc   set photo title success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_PHOTO_ASSET_HELPER_SET_0002', Level.LEVEL0, async (done: Function) => {
      let member = 'undefined' ;
      await sendAblePhotoAssetSetTest(done, 'SEND_ABLE_PHOTO_ASSET_HELPER_SET_0002',member,'newTitle',(errCode) => {
        expect(errCode == 14000014 ).assertTrue();
      })
    });

    /**
     * @tc.name   SEND_ABLE_PHOTO_ASSET_HELPER_SET_0003
     * @tc.number SEND_ABLE_PHOTO_ASSET_HELPER_SET_0003
     * @tc.desc   set photo title success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_PHOTO_ASSET_HELPER_SET_0003', Level.LEVEL0, async (done: Function) => {
      let member = photoAccessHelper.PhotoKeys.URI ;
      await sendAblePhotoAssetSetTest(done, 'SEND_ABLE_PHOTO_ASSET_HELPER_SET_0003',member,'newTitle',(errCode) => {
        expect(errCode == 14000014 ).assertTrue();
      })
    });

    /**
     * @tc.name   SEND_ABLE_PHOTO_ASSET_HELPER_SET_0004
     * @tc.number SEND_ABLE_PHOTO_ASSET_HELPER_SET_0004
     * @tc.desc   set photo title success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_PHOTO_ASSET_HELPER_SET_0004', Level.LEVEL0, async (done: Function) => {
      let member = 'abcdefghijklmnopqrstuvwxyz0123456789abcdefghijklmnopqrstuvwxyz0123456789abcdefghijklmnopqrstuvwxyz0123456789abcdefghijklmnopqrstuvwxyz0123456789abcdefghijklmnopqrstuvwxyz0123456789abcdefghijklmnopqrstuvwxyz0123456789abcdefghijklmnopqrstuvwxyz0123456789abcdefghijklmnopqrstuvwxyz0123456789abcdefghijklmnopqrstuvwxyz0123456789abcdefghijklmnopqrstuvwxyz0123456789' ;
      await sendAblePhotoAssetSetTest(done, 'SEND_ABLE_PHOTO_ASSET_HELPER_SET_0004',member,'newTitle',(errCode) => {
        expect(errCode == 14000014 ).assertTrue();
      })
    });

    /**
     * @tc.name   SEND_ABLE_PHOTO_ASSET_HELPER_SET_0005
     * @tc.number SEND_ABLE_PHOTO_ASSET_HELPER_SET_0005
     * @tc.desc   set photo title success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_PHOTO_ASSET_HELPER_SET_0005', Level.LEVEL0, async (done: Function) => {
      let member = photoAccessHelper.PhotoKeys.DISPLAY_NAME ;
      await sendAblePhotoAssetSetTest(done, 'SEND_ABLE_PHOTO_ASSET_HELPER_SET_0005',member,'newTitle',(errCode) => {
        expect(errCode == 14000014 ).assertTrue();
      })
    });

    /**
     * @tc.name   SEND_ABLE_PHOTO_ASSET_HELPER_SET_0006
     * @tc.number SEND_ABLE_PHOTO_ASSET_HELPER_SET_0006
     * @tc.desc   set photo title success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_PHOTO_ASSET_HELPER_SET_0006', Level.LEVEL0, async (done: Function) => {
      let member = '' ;
      await sendAblePhotoAssetSetTest(done, 'SEND_ABLE_PHOTO_ASSET_HELPER_SET_0006',member,'',(errCode) => {
        expect(errCode == 14000014 ).assertTrue();
      })
    });

    /**
     * @tc.name   SEND_ABLE_PHOTO_ASSET_HELPER_SET_0007
     * @tc.number SEND_ABLE_PHOTO_ASSET_HELPER_SET_0007
     * @tc.desc   set photo title success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_PHOTO_ASSET_HELPER_SET_0007', Level.LEVEL0, async (done: Function) => {
      let member = photoAccessHelper.PhotoKeys.TITLE ;
      await sendAblePhotoAssetSetTest(done, 'SEND_ABLE_PHOTO_ASSET_HELPER_SET_0007',member,'newTitle',(errCode) => {
        expect(errCode == undefined).assertTrue();
      })
    });

    /**
     * @tc.name   SEND_ABLE_PHOTO_ASSET_HELPER_SET_0008
     * @tc.number SEND_ABLE_PHOTO_ASSET_HELPER_SET_0008
     * @tc.desc   set photo title success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_PHOTO_ASSET_HELPER_SET_0008', Level.LEVEL0, async (done: Function) => {
      let member = 'null';
      await sendAblePhotoAssetSetTest(done, 'SEND_ABLE_PHOTO_ASSET_HELPER_SET_0008',member,'newTitle',(errCode) => {
        expect(errCode == 14000014 ).assertTrue();
      })
    });

    /**
     * @tc.name   SEND_ABLE_PHOTO_ASSET_HELPER_SET_0009
     * @tc.number SEND_ABLE_PHOTO_ASSET_HELPER_SET_0009
     * @tc.desc   set photo title success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_PHOTO_ASSET_HELPER_SET_0009', Level.LEVEL0, async (done: Function) => {
      let member = '-1';
      await sendAblePhotoAssetSetTest(done, 'SEND_ABLE_PHOTO_ASSET_HELPER_SET_0009',member,'newTitle',(errCode) => {
        expect(errCode == 14000014 ).assertTrue();
      })
    });

    /**
     * @tc.name   SEND_ABLE_PHOTO_ASSET_HELPER_SET_0010
     * @tc.number SEND_ABLE_PHOTO_ASSET_HELPER_SET_0010
     * @tc.desc   set photo title success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_PHOTO_ASSET_HELPER_SET_0010', Level.LEVEL0, async (done: Function) => {
      let member = photoAccessHelper.PhotoKeys.TITLE;
      await sendAblePhotoAssetSetTest(done, 'SEND_ABLE_PHOTO_ASSET_HELPER_SET_0010',member,'newTitle.txt',(errCode) => {
        expect(errCode == undefined ).assertTrue();
      })
    });

    /**
     * @tc.name   SEND_ABLE_PHOTO_ASSET_HELPER_SET_0011
     * @tc.number SEND_ABLE_PHOTO_ASSET_HELPER_SET_0011
     * @tc.desc   set photo title success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_PHOTO_ASSET_HELPER_SET_0011', Level.LEVEL0, async (done: Function) => {
      let member = photoAccessHelper.PhotoKeys.TITLE;
      await sendAblePhotoAssetSetTest(done, 'SEND_ABLE_PHOTO_ASSET_HELPER_SET_0011',member,'newTitle.xlsx',(errCode) => {
        expect(errCode == undefined ).assertTrue();
      })
    });

    /**
     * @tc.name   SEND_ABLE_PHOTO_ASSET_HELPER_SET_0012
     * @tc.number SEND_ABLE_PHOTO_ASSET_HELPER_SET_0012
     * @tc.desc   set photo title success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_PHOTO_ASSET_HELPER_SET_0012', Level.LEVEL0, async (done: Function) => {
      let member = photoAccessHelper.PhotoKeys.TITLE;
      await sendAblePhotoAssetSetTest(done, 'SEND_ABLE_PHOTO_ASSET_HELPER_SET_0012',member,'newTitle.png',(errCode) => {
        expect(errCode == undefined ).assertTrue();
      })
    });

    /**
     * @tc.name   SEND_ABLE_PHOTO_ASSET_HELPER_SET_0013
     * @tc.number SEND_ABLE_PHOTO_ASSET_HELPER_SET_0013
     * @tc.desc   set photo title success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_PHOTO_ASSET_HELPER_SET_0013', Level.LEVEL0, async (done: Function) => {
      let member = photoAccessHelper.PhotoKeys.TITLE;
      await sendAblePhotoAssetSetTest(done, 'SEND_ABLE_PHOTO_ASSET_HELPER_SET_0013',member,'abcdefghijklmnopqrstuvwxyz0123456789abcdefghijklmnopqrstuvwxyz0123456789abcdefghijklmnopqrstuvwxyz0123456789abcdefghijklmnopqrstuvwxyz0123456789abcdefghijklmnopqrstuvwxyz0123456789abcdefghijklmnopqrstuvwxyz0123456789abcdefghijklmnopqrstuvwxyz0123456789abcdefghijklmnopqrstuvwxyz0123456789abcdefghijklmnopqrstuvwxyz0123456789abcdefghijklmnopqrstuvwxyz0123456789.png',(errCode) => {
        expect(errCode == undefined ).assertTrue();
      })
    });

    /**
     * @tc.name   SEND_ABLE_PHOTO_ASSET_HELPER_SET_0014
     * @tc.number SEND_ABLE_PHOTO_ASSET_HELPER_SET_0014
     * @tc.desc   set photo title success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_PHOTO_ASSET_HELPER_SET_0014', Level.LEVEL0, async (done: Function) => {
      let member = photoAccessHelper.PhotoKeys.TITLE;
      await sendAblePhotoAssetSetTest(done, 'SEND_ABLE_PHOTO_ASSET_HELPER_SET_0014',member,'new.Title',(errCode) => {
        expect(errCode == undefined ).assertTrue();
      })
    });

    /**
     * @tc.name   SEND_ABLE_PHOTO_ASSET_HELPER_SET_0015
     * @tc.number SEND_ABLE_PHOTO_ASSET_HELPER_SET_0015
     * @tc.desc   set photo title success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_PHOTO_ASSET_HELPER_SET_0015', Level.LEVEL0, async (done: Function) => {
      let member = photoAccessHelper.PhotoKeys.TITLE;
      await sendAblePhotoAssetSetTest(done, 'SEND_ABLE_PHOTO_ASSET_HELPER_SET_0015',member,'new\\Title',(errCode) => {
        expect(errCode == undefined ).assertTrue();
      })
    });

    /**
     * @tc.name   SEND_ABLE_PHOTO_ASSET_HELPER_SET_0016
     * @tc.number SEND_ABLE_PHOTO_ASSET_HELPER_SET_0016
     * @tc.desc   set photo title success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_PHOTO_ASSET_HELPER_SET_0016', Level.LEVEL0, async (done: Function) => {
      let member = photoAccessHelper.PhotoKeys.TITLE;
      await sendAblePhotoAssetSetTest(done, 'SEND_ABLE_PHOTO_ASSET_HELPER_SET_0016',member,'new/Title',(errCode) => {
        expect(errCode == undefined ).assertTrue();
      })
    });

    /**
     * @tc.name   SEND_ABLE_PHOTO_ASSET_HELPER_SET_0017
     * @tc.number SEND_ABLE_PHOTO_ASSET_HELPER_SET_0017
     * @tc.desc   set photo title success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_PHOTO_ASSET_HELPER_SET_0017', Level.LEVEL0, async (done: Function) => {
      let member = photoAccessHelper.PhotoKeys.TITLE;
      await sendAblePhotoAssetSetTest(done, 'SEND_ABLE_PHOTO_ASSET_HELPER_SET_0017',member,'new:Title',(errCode) => {
        expect(errCode == undefined ).assertTrue();
      })
    });

    /**
     * @tc.name   SEND_ABLE_PHOTO_ASSET_HELPER_SET_0018
     * @tc.number SEND_ABLE_PHOTO_ASSET_HELPER_SET_0018
     * @tc.desc   set photo title success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_PHOTO_ASSET_HELPER_SET_0018', Level.LEVEL0, async (done: Function) => {
      let member = photoAccessHelper.PhotoKeys.TITLE;
      await sendAblePhotoAssetSetTest(done, 'SEND_ABLE_PHOTO_ASSET_HELPER_SET_0018',member,'new*Title',(errCode) => {
        expect(errCode == undefined ).assertTrue();
      })
    });

    /**
     * @tc.name   SEND_ABLE_PHOTO_ASSET_HELPER_SET_0019
     * @tc.number SEND_ABLE_PHOTO_ASSET_HELPER_SET_0019
     * @tc.desc   set photo title success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_PHOTO_ASSET_HELPER_SET_0019', Level.LEVEL0, async (done: Function) => {
      let member = photoAccessHelper.PhotoKeys.TITLE;
      await sendAblePhotoAssetSetTest(done, 'SEND_ABLE_PHOTO_ASSET_HELPER_SET_0019',member,'new?Title',(errCode) => {
        expect(errCode == undefined ).assertTrue();
      })
    });

    /**
     * @tc.name   SEND_ABLE_PHOTO_ASSET_HELPER_SET_0020
     * @tc.number SEND_ABLE_PHOTO_ASSET_HELPER_SET_0020
     * @tc.desc   set photo title success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_PHOTO_ASSET_HELPER_SET_0020', Level.LEVEL0, async (done: Function) => {
      let member = photoAccessHelper.PhotoKeys.TITLE;
      await sendAblePhotoAssetSetTest(done, 'SEND_ABLE_PHOTO_ASSET_HELPER_SET_0020',member,'new"Title',(errCode) => {
        expect(errCode == undefined ).assertTrue();
      })
    });

    /**
     * @tc.name   SEND_ABLE_PHOTO_ASSET_HELPER_SET_0021
     * @tc.number SEND_ABLE_PHOTO_ASSET_HELPER_SET_0021
     * @tc.desc   set photo title success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_PHOTO_ASSET_HELPER_SET_0021', Level.LEVEL0, async (done: Function) => {
      let member = photoAccessHelper.PhotoKeys.TITLE;
      await sendAblePhotoAssetSetTest(done, 'SEND_ABLE_PHOTO_ASSET_HELPER_SET_0021',member,'new\'Title',(errCode) => {
        expect(errCode == undefined ).assertTrue();
      })
    });

    /**
     * @tc.name   SEND_ABLE_PHOTO_ASSET_HELPER_SET_0022
     * @tc.number SEND_ABLE_PHOTO_ASSET_HELPER_SET_0022
     * @tc.desc   set photo title success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_PHOTO_ASSET_HELPER_SET_0022', Level.LEVEL0, async (done: Function) => {
      let member = photoAccessHelper.PhotoKeys.TITLE;
      await sendAblePhotoAssetSetTest(done, 'SEND_ABLE_PHOTO_ASSET_HELPER_SET_0022',member,'new<Title',(errCode) => {
        expect(errCode == undefined ).assertTrue();
      })
    });

    /**
     * @tc.name   SEND_ABLE_PHOTO_ASSET_HELPER_SET_0023
     * @tc.number SEND_ABLE_PHOTO_ASSET_HELPER_SET_0023
     * @tc.desc   set photo title success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_PHOTO_ASSET_HELPER_SET_0023', Level.LEVEL0, async (done: Function) => {
      let member = photoAccessHelper.PhotoKeys.TITLE;
      await sendAblePhotoAssetSetTest(done, 'SEND_ABLE_PHOTO_ASSET_HELPER_SET_0023',member,'new>Title',(errCode) => {
        expect(errCode == undefined ).assertTrue();
      })
    });

    /**
     * @tc.name   SEND_ABLE_PHOTO_ASSET_HELPER_SET_0024
     * @tc.number SEND_ABLE_PHOTO_ASSET_HELPER_SET_0024
     * @tc.desc   set photo title success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_PHOTO_ASSET_HELPER_SET_0024', Level.LEVEL0, async (done: Function) => {
      let member = photoAccessHelper.PhotoKeys.TITLE;
      await sendAblePhotoAssetSetTest(done, 'SEND_ABLE_PHOTO_ASSET_HELPER_SET_0024',member,'new|Title',(errCode) => {
        expect(errCode == undefined ).assertTrue();
      })
    });

    /**
     * @tc.name   SEND_ABLE_PHOTO_ASSET_HELPER_SET_0025
     * @tc.number SEND_ABLE_PHOTO_ASSET_HELPER_SET_0025
     * @tc.desc   set photo title success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_PHOTO_ASSET_HELPER_SET_0025', Level.LEVEL0, async (done: Function) => {
      let member = photoAccessHelper.PhotoKeys.TITLE;
      await sendAblePhotoAssetSetTest(done, 'SEND_ABLE_PHOTO_ASSET_HELPER_SET_0025',member,'new{Title',(errCode) => {
        expect(errCode == undefined ).assertTrue();
      })
    });

    /**
     * @tc.name   SEND_ABLE_PHOTO_ASSET_HELPER_SET_0026
     * @tc.number SEND_ABLE_PHOTO_ASSET_HELPER_SET_0026
     * @tc.desc   set photo title success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_PHOTO_ASSET_HELPER_SET_0026', Level.LEVEL0, async (done: Function) => {
      let member = photoAccessHelper.PhotoKeys.TITLE;
      await sendAblePhotoAssetSetTest(done, 'SEND_ABLE_PHOTO_ASSET_HELPER_SET_0026',member,'new}Title',(errCode) => {
        expect(errCode == undefined ).assertTrue();
      })
    });

    /**
     * @tc.name   SEND_ABLE_PHOTO_ASSET_HELPER_SET_0027
     * @tc.number SEND_ABLE_PHOTO_ASSET_HELPER_SET_0027
     * @tc.desc   set photo title success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_PHOTO_ASSET_HELPER_SET_0027', Level.LEVEL0, async (done: Function) => {
      let member = photoAccessHelper.PhotoKeys.TITLE;
      await sendAblePhotoAssetSetTest(done, 'SEND_ABLE_PHOTO_ASSET_HELPER_SET_0027',member,'new[Title',(errCode) => {
        expect(errCode == undefined ).assertTrue();
      })
    });

    /**
     * @tc.name   SEND_ABLE_PHOTO_ASSET_HELPER_SET_0028
     * @tc.number SEND_ABLE_PHOTO_ASSET_HELPER_SET_0028
     * @tc.desc   set photo title success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_PHOTO_ASSET_HELPER_SET_0028', Level.LEVEL0, async (done: Function) => {
      let member = photoAccessHelper.PhotoKeys.TITLE;
      await sendAblePhotoAssetSetTest(done, 'SEND_ABLE_PHOTO_ASSET_HELPER_SET_0028',member,'new]Title',(errCode) => {
        expect(errCode == undefined ).assertTrue();
      })
    });

    /**
     * @tc.name   SEND_ABLE_PHOTO_ASSET_HELPER_SET_0029
     * @tc.number SEND_ABLE_PHOTO_ASSET_HELPER_SET_0029
     * @tc.desc   set photo title success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_PHOTO_ASSET_HELPER_SET_0029', Level.LEVEL0, async (done: Function) => {
      let member = '汉字';
      await sendAblePhotoAssetSetTest(done, 'SEND_ABLE_PHOTO_ASSET_HELPER_SET_0029',member,'newTitle',(errCode) => {
        expect(errCode == 14000014 ).assertTrue();
      })
    });

    /**
     * @tc.name   SEND_ABLE_PHOTO_ASSET_HELPER_SET_0030
     * @tc.number SEND_ABLE_PHOTO_ASSET_HELPER_SET_0030
     * @tc.desc   member min length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_PHOTO_ASSET_HELPER_SET_0030', Level.LEVEL0, async (done: Function) => {
      let member = 'a';
      await sendAblePhotoAssetSetTest(done, 'SEND_ABLE_PHOTO_ASSET_HELPER_SET_0029',member,'newTitle',(errCode) => {
        expect(errCode == 14000014 ).assertTrue();
      })
    });

    /**
     * @tc.name   SEND_ABLE_PHOTO_ASSET_HELPER_SET_0031
     * @tc.number SEND_ABLE_PHOTO_ASSET_HELPER_SET_0031
     * @tc.desc   member max length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_PHOTO_ASSET_HELPER_SET_0031', Level.LEVEL0, async (done: Function) => {
      let member = 'abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstadfereuvwxyzabcdefghijdddddklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghij';
      await sendAblePhotoAssetSetTest(done, 'SEND_ABLE_PHOTO_ASSET_HELPER_SET_0029',member,'newTitle',(errCode) => {
        expect(errCode == 14000014 ).assertTrue();
      })
    });

    /**
     * @tc.name   SEND_ABLE_PHOTO_ASSET_HELPER_SET_0032
     * @tc.number SEND_ABLE_PHOTO_ASSET_HELPER_SET_0032
     * @tc.desc   member max length + 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_PHOTO_ASSET_HELPER_SET_0032', Level.LEVEL0, async (done: Function) => {
      let member = 'a1bcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstadfereuvwxyzabcdefghijdddddklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghij';
      await sendAblePhotoAssetSetTest(done, 'SEND_ABLE_PHOTO_ASSET_HELPER_SET_0029',member,'newTitle',(errCode) => {
        expect(errCode == 14000014 ).assertTrue();
      })
    });

    /**
     * @tc.name   SEND_ABLE_PHOTO_ASSET_HELPER_SET_0033
     * @tc.number SEND_ABLE_PHOTO_ASSET_HELPER_SET_0033
     * @tc.desc   value min length -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_PHOTO_ASSET_HELPER_SET_0033', Level.LEVEL0, async (done: Function) => {
      let member = photoAccessHelper.PhotoKeys.TITLE;
      let value = '';
      await sendAblePhotoAssetSetTest(done, 'SEND_ABLE_PHOTO_ASSET_HELPER_SET_0029',member, value,(errCode) => {
        expect(errCode == 14000014 ).assertTrue();
      })
    });

    /**
     * @tc.name   SEND_ABLE_PHOTO_ASSET_HELPER_SET_0034
     * @tc.number SEND_ABLE_PHOTO_ASSET_HELPER_SET_0034
     * @tc.desc   value min length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_PHOTO_ASSET_HELPER_SET_0034', Level.LEVEL0, async (done: Function) => {
      let member = photoAccessHelper.PhotoKeys.TITLE;
      let value = 'q';
      await sendAblePhotoAssetSetTest(done, 'SEND_ABLE_PHOTO_ASSET_HELPER_SET_0029',member, value,(errCode) => {
        expect(errCode == 14000014 ).assertTrue();
      })
    });

    /**
     * @tc.name   SEND_ABLE_PHOTO_ASSET_HELPER_SET_0035
     * @tc.number SEND_ABLE_PHOTO_ASSET_HELPER_SET_0035
     * @tc.desc   value max length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_PHOTO_ASSET_HELPER_SET_0035', Level.LEVEL0, async (done: Function) => {
      let member = photoAccessHelper.PhotoKeys.TITLE;
      let value = '1bcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstadfereuvwxyzabcdefghijdddddklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghij';
      await sendAblePhotoAssetSetTest(done, 'SEND_ABLE_PHOTO_ASSET_HELPER_SET_0029',member, value,(errCode) => {
        expect(errCode == 14000014 ).assertTrue();
      })
    });

    /**
     * @tc.name   SEND_ABLE_PHOTO_ASSET_HELPER_SET_0036
     * @tc.number SEND_ABLE_PHOTO_ASSET_HELPER_SET_0036
     * @tc.desc   value max length + 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_PHOTO_ASSET_HELPER_SET_0036', Level.LEVEL0, async (done: Function) => {
      let member = photoAccessHelper.PhotoKeys.TITLE;
      let value = 'a1bcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstadfereuvwxyzabcdefghijdddddklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghij';
      await sendAblePhotoAssetSetTest(done, 'SEND_ABLE_PHOTO_ASSET_HELPER_SET_0029',member, value,(errCode) => {
        expect(errCode == 14000014 ).assertTrue();
      })
    });

  })
}