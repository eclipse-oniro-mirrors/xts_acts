/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import media from '@ohos.multimedia.media'
import fileio from '@ohos.fileio'
import * as mediaTestBase from '../../../../../../MediaTestBase';
import * as AVPlayerTestBase from '../../../../../../AVPlayerTestBase.js';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function AVPlayerAmr() {
  describe('AVPlayerAmr', function () {
    let TAG = "[AVPlayerAmr] ";
    let callBackSet = 0;
    let avPlayer = null;
    let fileDescriptor = null;
    let fdHead = 'fd://';
    let fdPath = '';
    let fdNumber = 0;
    let fdNumbers = []
    const PLAY_TIME = 2;

    beforeAll(async function () {
      console.info('beforeAll case');
    })
    async function getConverts(pathName) {
      await getStageFdRead(pathName).then((testNumber) => {
        fdNumber = testNumber;
        console.info(TAG + 'this fdNumber is :' + fdNumber)
        fdPath = fdHead + '' + fdNumber;
        console.log(fdPath, '文件名称路径');
        return fdPath;

      })
    }

    async function getStageFdRead(pathName) {
      let fdReturn;
      let contextStage = globalThis.context;
      let fileDir = contextStage.filesDir
      console.info("case file dir is" + JSON.stringify(fileDir));
      pathName = fileDir + '/' + pathName;
      console.info("case pathName is" + pathName);
      await fileio.open(pathName).then((fdNumber) => {
        fdReturn = fdNumber;
        console.info('[fileio]case open fd success, fd is ' + fdReturn);
      })
      return fdReturn;
    }


    beforeEach(async function () {
      console.info('beforeEach case');
      await AVPlayerTestBase.sleep(1000);
    })

    afterEach(async function () {
      if (avPlayer != null) {
        avPlayer.release().then(() => {
          console.info(TAG + 'this testCase execution completed')
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      }
      console.info('afterEach case');
      await AVPlayerTestBase.sleep(1000);
    })

    afterAll(async function () {
      console.info('afterAll case');
      for (var i = 0; i < fdNumbers.length; i++) {
        await mediaTestBase.closeFdNumber(fdNumbers[i]);
      }
    })

    /* *
   * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_0100
   * @tc.name      : 001.test play source amrnb_4.75k_8000.amr
   * @tc.desc      : Local Video play source amrnb_4.75k_8000.amr
   * @tc.size      : MediumTest
   * @tc.type      : Function test
   * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_0100', 0, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_0100 start')
      await getConverts('amrnb_4.75k_8000.amr');
      await AVPlayerTestBase.avPlayerPlay(fdPath, avPlayer, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_0100 end')
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_0200
        * @tc.name      : 001.test play source amrnb_5.9k_8000.amr
        * @tc.desc      : Local Video play source amrnb_5.9k_8000.amr
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_0200', 0, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_0200 start')
      await getConverts('amrnb_5.9k_8000.amr');
      await AVPlayerTestBase.avPlayerPlay(fdPath, avPlayer, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_0200 end')
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_0200
        * @tc.name      : 001.test play source amrnb_5.15k_8000.amr
        * @tc.desc      : Local Video play source amrnb_5.15k_8000.amr
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_0300', 0, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_0300 start')
      await getConverts('amrnb_5.15k_8000.amr');
      await AVPlayerTestBase.avPlayerPlay(fdPath, avPlayer, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_0300 end')
    })
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_0400
        * @tc.name      : 001.test play source amrnb_6.7k_8000.amr
        * @tc.desc      : Local Video play source amrnb_6.7k_8000.amr
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_0400', 0, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_0400 start')
      await getConverts('amrnb_6.7k_8000.amr');
      await AVPlayerTestBase.avPlayerPlay(fdPath, avPlayer, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_0400 end')
    })
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_0500
        * @tc.name      : 001.test play source amrnb_7.4k_8000.amr
        * @tc.desc      : Local Video play source amrnb_7.4k_8000.amr
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_0500', 0, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_0500 start')
      await getConverts('amrnb_7.4k_8000.amr');
      await AVPlayerTestBase.avPlayerPlay(fdPath, avPlayer, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_0500 end')
    })
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_0600
        * @tc.name      : 001.test play source amrnb_7.95k_8000.amr
        * @tc.desc      : Local Video play source amrnb_7.95k_8000.amr
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_0600', 0, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_0600 start')
      await getConverts('amrnb_7.95k_8000.amr');
      await AVPlayerTestBase.avPlayerPlay(fdPath, avPlayer, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_0600 end')
    })
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_0700
        * @tc.name      : 001.test play source amrnb_10.2k_8000.amr
        * @tc.desc      : Local Video play source amrnb_10.2k_8000.amr
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_0700', 0, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_0700 start')
      await getConverts('amrnb_10.2k_8000.amr');
      await AVPlayerTestBase.avPlayerPlay(fdPath, avPlayer, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_0700 end')
    })
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_0800
        * @tc.name      : 001.test play source amrnb_12.2k_8000.amr
        * @tc.desc      : Local Video play source amrnb_12.2k_8000.amr
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_0800', 0, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_0800 start')
      await getConverts('amrnb_12.2k_8000.amr');
      await AVPlayerTestBase.avPlayerPlay(fdPath, avPlayer, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_0800 end')
    })
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_0900
        * @tc.name      : 001.test play source amrwb_6.6k_16000.amr
        * @tc.desc      : Local Video play source amrwb_6.6k_16000.amr
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_0900', 0, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_0900 start')
      await getConverts('amrwb_6.6k_16000.amr');
      await AVPlayerTestBase.avPlayerPlay(fdPath, avPlayer, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_0900 end')
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_1000
        * @tc.name      : 001.test play source amrwb_8.85k_16000.amr
        * @tc.desc      : Local Video play source amrwb_8.85k_16000.amr
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_1000', 0, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_1000 start')
      await getConverts('amrwb_8.85k_16000.amr');
      await AVPlayerTestBase.avPlayerPlay(fdPath, avPlayer, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_1000 end')
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_1100
        * @tc.name      : 001.test play source amrwb_12.65k_16000.amr
        * @tc.desc      : Local Video play source amrwb_12.65k_16000.amr
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_1100', 0, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_1100 start')
      await getConverts('amrwb_12.65k_16000.amr');
      await AVPlayerTestBase.avPlayerPlay(fdPath, avPlayer, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_1100 end')
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_1200
        * @tc.name      : 001.test play source amrwb_14.25k_16000.amr
        * @tc.desc      : Local Video play source amrwb_14.25k_16000.amr
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_1200', 0, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_1200 start')
      await getConverts('amrwb_14.25k_16000.amr');
      await AVPlayerTestBase.avPlayerPlay(fdPath, avPlayer, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_1200 end')
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_1300
        * @tc.name      : 001.test play source amrwb_15.85k_16000.amr
        * @tc.desc      : Local Video play source amrwb_15.85k_16000.amr
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_1300', 0, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_1300 start')
      await getConverts('amrwb_15.85k_16000.amr');
      await AVPlayerTestBase.avPlayerPlay(fdPath, avPlayer, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_1300 end')
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_1400
        * @tc.name      : 001.test play source amrwb_18.25k_16000.amr
        * @tc.desc      : Local Video play source amrwb_18.25k_16000.amr
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_1400', 0, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_1400 start')
      await getConverts('amrwb_18.25k_16000.amr');
      await AVPlayerTestBase.avPlayerPlay(fdPath, avPlayer, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_1400 end')
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_1500
        * @tc.name      : 001.test play source amrwb_19.85k_16000.amr
        * @tc.desc      : Local Video play source amrwb_19.85k_16000.amr
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_1500', 0, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_1500 start')
      await getConverts('amrwb_19.85k_16000.amr');
      await AVPlayerTestBase.avPlayerPlay(fdPath, avPlayer, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_1500 end')
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_1600
        * @tc.name      : 001.test play source amrwb_23.05k_16000.amr
        * @tc.desc      : Local Video play source amrwb_23.05k_16000.amr
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_1600', 0, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_1600 start')
      await getConverts('amrwb_23.05k_16000.amr');
      await AVPlayerTestBase.avPlayerPlay(fdPath, avPlayer, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_1600 end')
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_1700
        * @tc.name      : 001.test play source amrwb_23.85k_16000.amr
        * @tc.desc      : Local Video play source amrwb_23.85k_16000.amr
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_1700', 0, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_1700 start')
      await getConverts('amrwb_23.85k_16000.amr');
      await AVPlayerTestBase.avPlayerPlay(fdPath, avPlayer, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_AMR_1700 end')
    })
    
  })
}