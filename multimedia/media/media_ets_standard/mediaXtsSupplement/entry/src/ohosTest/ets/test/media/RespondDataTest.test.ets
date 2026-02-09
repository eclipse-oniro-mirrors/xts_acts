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
import media from '@ohos.multimedia.media';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import HashMap from '@ohos.util.HashMap';

const TAG = 'AVPlayer.MediaSource';

const url_1a1v_ts = "https://hwposter-inland.hwcloudtest.cn/rem/DTA/20240117/h264-sm4c-ts/ChinaDRMLab_Promo_210525-264-30-480P-2000K.sm4c.ts"
const url_1a1v_m3u8 = "https://hwposter-inland.hwcloudtest.cn/rem/DTA/20240117/h264-sm4c-hls/ChinaDRMLab_Promo_210525-264-30-480P-2000K/sm4c.m3u8"
const url_1a1v_mpd = "https://hwposter-inland.hwcloudtest.cn/rem/ruanjie/h264_480x270_0.2m_30fp_cenc/dash.mpd"


async function getAVPlayerRequest(testName: string, url: string, callBack: (request: media.MediaSourceLoadingRequest) => void) {
  let avPlayer = await media.createAVPlayer()
  let headers: Record<string, string> = {"User-Agent" : "User-Agent-Value"};
  let mediaSource : media.MediaSource = media.createMediaSourceWithUrl(url,  headers);
  let uuid: number = 1;
  let requests: HashMap<number, media.MediaSourceLoadingRequest> = new HashMap();
  let playStrategy: media.PlaybackStrategy = {
    preferredWidth: 1,
    preferredHeight: 2,
    preferredBufferDuration: 3,
    preferredHdr: false,
    preferredBufferDurationForPlaying: 1,
    showFirstFrameOnPrepare: false
  };
  let SourceCallbackCount: number = 0

  let sourceOpenCallback: media.SourceOpenCallback = (request: media.MediaSourceLoadingRequest) => {
    SourceCallbackCount++
    console.log(TAG,testName, `Opening resource: ${request.url}`);
    uuid += 1;
    requests.set(uuid, request);
    callBack(request);
    return uuid;
  };

  let sourceReadCallback: media.SourceReadCallback = (uuid: number, requestedOffset: number, requestedLength: number) => {
    SourceCallbackCount++
    console.log(TAG,`Reading resource with handle ${uuid}, offset: ${requestedOffset}, length: ${requestedLength}`);
    avPlayer.release()
  };

  let sourceCloseCallback: media.SourceCloseCallback = (uuid: number) => {
    SourceCallbackCount++
    console.log(TAG,`Closing resource with handle ${uuid}`);
    requests.remove(uuid);
  };

  let resourceLoader: media.MediaSourceLoader = {
    open: sourceOpenCallback,
    read: sourceReadCallback,
    close: sourceCloseCallback
  };

  mediaSource.setMediaResourceLoaderDelegate(resourceLoader);
  console.log(TAG,`setMediaResourceLoaderDelegate success`)
  avPlayer.on("stateChange",async (state: media.AVPlayerState) => {
    console.info(`state change, current state is: ${state}`)
    if(state == "initialized"){
      console.info(TAG,`avPlayer enter initialized state`)
      avPlayer.prepare().then(() => {
        console.log(TAG,`avPlayer.prepare().then`)
      })
    }
    if(state == "prepared"){
      console.info(TAG,`avPlayer enter prepared state`)
    }
    if(state == "released"){
      console.info(TAG,`avPlayer enter released state`)
      // expect(SourceCallbackCount).assertEqual(4)
    }
  })
  avPlayer.setMediaSource(mediaSource, playStrategy)
  console.log(TAG,`setMediaSource success`)
}

export default function RespondDataTest() {
  describe('RespondDataTest', () => {
    beforeAll(async () => {
      console.info(TAG,'beforeAll case');
    });
    beforeEach(async () => {
      console.info(TAG,'beforeEach case');
    });
    afterEach(async () => {
      console.info(TAG,'afterEach case');
    });
    afterAll(async () => {
      console.info(TAG,'afterAll case');
    });

    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_001
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_001
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_001', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_001';
      try {
        await getAVPlayerRequest(testName, url_1a1v_ts, (request: media.MediaSourceLoadingRequest) => {
          request.respondData(1,0,null);
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });

    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_002
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_002
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_002', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_002';
      try {
        await getAVPlayerRequest(testName, url_1a1v_ts, (request: media.MediaSourceLoadingRequest) => {
          request.respondData(1,0,undefined);
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });

    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_003
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_003
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_003', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_003';
      try {
        AppStorage.setOrCreate('key', '');
        let buffer: ArrayBuffer = AppStorage.get('key') as ESObject;
        await getAVPlayerRequest(testName, url_1a1v_ts, (request: media.MediaSourceLoadingRequest) => {
          request.respondData(1,0,buffer);
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });

    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_004
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_004
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_004', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_004';
      try {
        await getAVPlayerRequest(testName, url_1a1v_m3u8, (request: media.MediaSourceLoadingRequest) => {
          request.respondData(1,0,null);
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });

    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_005
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_005
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_005', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_005';
      try {
        await getAVPlayerRequest(testName, url_1a1v_m3u8, (request: media.MediaSourceLoadingRequest) => {
          request.respondData(1,0,undefined);
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });

    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_006
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_006
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_006', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_006';
      try {
        AppStorage.setOrCreate('key', '');
        let buffer: ArrayBuffer = AppStorage.get('key') as ESObject;
        await getAVPlayerRequest(testName, url_1a1v_m3u8, (request: media.MediaSourceLoadingRequest) => {
          request.respondData(1,0,buffer);
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });

    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_007
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_007
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_007', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_007';
      try {
        await getAVPlayerRequest(testName, url_1a1v_mpd, (request: media.MediaSourceLoadingRequest) => {
          request.respondData(1,0,null);
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });

    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_008
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_008
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_008', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_008';
      try {
        await getAVPlayerRequest(testName, url_1a1v_mpd, (request: media.MediaSourceLoadingRequest) => {
          request.respondData(1,0,undefined);
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });

    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_009
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_009
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_009', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_009';
      try {
        AppStorage.setOrCreate('key', '');
        let buffer: ArrayBuffer = AppStorage.get('key') as ESObject;
        await getAVPlayerRequest(testName, url_1a1v_mpd, (request: media.MediaSourceLoadingRequest) => {
          request.respondData(1,0,buffer);
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });

    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_010
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_010
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_010', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_010';
      try {
        AppStorage.setOrCreate('key', null);
        let header: Record<string, string> = AppStorage.get('key') as ESObject;
        await getAVPlayerRequest(testName, url_1a1v_ts, (request: media.MediaSourceLoadingRequest) => {
          request.respondHeader(1,header,'');
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });

    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_011
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_011
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_011', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_011';
      try {
        AppStorage.setOrCreate('key', undefined);
        let header: Record<string, string> = AppStorage.get('key') as ESObject;
        await getAVPlayerRequest(testName, url_1a1v_ts, (request: media.MediaSourceLoadingRequest) => {
          request.respondHeader(1,header,'');
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });

    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_012
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_012
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_012', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_012';
      try {
        AppStorage.setOrCreate('key', '');
        let header: Record<string, string> = AppStorage.get('key') as ESObject;
        await getAVPlayerRequest(testName, url_1a1v_ts, (request: media.MediaSourceLoadingRequest) => {
          request.respondHeader(1,header,'');
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });

    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_013
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_013
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_013', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_013';
      try {
        let header:Record<string, string> = {
          'Transfer-Encoding':'xxx',
          'Location' : 'xxx',
          'Content-Type' : 'xxx',
          'Content-Range' : 'xxx',
          'Content-Encode' : 'xxx',
          'Accept-Ranges' : 'xxx',
          'content-length' : 'xxx'
        };
        AppStorage.setOrCreate('key', null);
        let redirectUrl: string = AppStorage.get('key') as ESObject;
        await getAVPlayerRequest(testName, url_1a1v_m3u8, (request: media.MediaSourceLoadingRequest) => {
          request.respondHeader(1,header,redirectUrl);
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });
    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_014
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_014
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_014', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_014';
      try {
        let header:Record<string, string> = {
          'Transfer-Encoding':'xxx',
          'Location' : 'xxx',
          'Content-Type' : 'xxx',
          'Content-Range' : 'xxx',
          'Content-Encode' : 'xxx',
          'Accept-Ranges' : 'xxx',
          'content-length' : 'xxx'
        };
        AppStorage.setOrCreate('key', undefined);
        let redirectUrl: string = AppStorage.get('key') as ESObject;
        await getAVPlayerRequest(testName, url_1a1v_m3u8, (request: media.MediaSourceLoadingRequest) => {
          request.respondHeader(1,header,redirectUrl);
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });
    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_015
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_015
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_015', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_015';
      try {
        let header:Record<string, string> = {
          'Transfer-Encoding':'xxx',
          'Location' : 'xxx',
          'Content-Type' : 'xxx',
          'Content-Range' : 'xxx',
          'Content-Encode' : 'xxx',
          'Accept-Ranges' : 'xxx',
          'content-length' : 'xxx'
        };
        AppStorage.setOrCreate('key', '');
        let redirectUrl: string = AppStorage.get('key') as ESObject;
        await getAVPlayerRequest(testName, url_1a1v_m3u8, (request: media.MediaSourceLoadingRequest) => {
          request.respondHeader(1,header,redirectUrl);
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });
    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_016
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_016
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_016', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_016';
      try {
        let header:Record<string, string> = {
          'Transfer-Encoding':'xxx',
          'Location' : 'xxx',
          'Content-Type' : 'xxx',
          'Content-Range' : 'xxx',
          'Content-Encode' : 'xxx',
          'Accept-Ranges' : 'xxx',
          'content-length' : 'xxx'
        };
        AppStorage.setOrCreate('key', null);
        let redirectUrl: string = AppStorage.get('key') as ESObject;
        await getAVPlayerRequest(testName, url_1a1v_mpd, (request: media.MediaSourceLoadingRequest) => {
          request.respondHeader(1,header,redirectUrl);
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });
    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_017
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_017
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_017', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_017';
      try {
        let header:Record<string, string> = {
          'Transfer-Encoding':'xxx',
          'Location' : 'xxx',
          'Content-Type' : 'xxx',
          'Content-Range' : 'xxx',
          'Content-Encode' : 'xxx',
          'Accept-Ranges' : 'xxx',
          'content-length' : 'xxx'
        };
        AppStorage.setOrCreate('key', undefined);
        let redirectUrl: string = AppStorage.get('key') as ESObject;
        await getAVPlayerRequest(testName, url_1a1v_mpd, (request: media.MediaSourceLoadingRequest) => {
          request.respondHeader(1,header,redirectUrl);
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });
    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_018
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_018
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_018', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_018';
      try {
        let header:Record<string, string> = {
          'Transfer-Encoding':'xxx',
          'Location' : 'xxx',
          'Content-Type' : 'xxx',
          'Content-Range' : 'xxx',
          'Content-Encode' : 'xxx',
          'Accept-Ranges' : 'xxx',
          'content-length' : 'xxx'
        };
        AppStorage.setOrCreate('key', '');
        let redirectUrl: string = AppStorage.get('key') as ESObject;
        await getAVPlayerRequest(testName, url_1a1v_mpd, (request: media.MediaSourceLoadingRequest) => {
          request.respondHeader(1,header,redirectUrl);
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });
    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_019
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_019
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_019', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_019';
      try {
        await getAVPlayerRequest(testName, url_1a1v_ts, (request: media.MediaSourceLoadingRequest) => {
          request.finishLoading(1,media.LoadingRequestError.LOADING_ERROR_NOT_READY);
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });
    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_020
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_020
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_020', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_020';
      try {
        await getAVPlayerRequest(testName, url_1a1v_ts, (request: media.MediaSourceLoadingRequest) => {
          request.finishLoading(1,media.LoadingRequestError.LOADING_ERROR_AUTHORIZE_FAILED);
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });
    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_021
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_021
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_021', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_021';
      try {
        await getAVPlayerRequest(testName, url_1a1v_ts, (request: media.MediaSourceLoadingRequest) => {
          request.finishLoading(1,media.LoadingRequestError.LOADING_ERROR_ACCESS_DENIED);
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });
    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_022
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_022
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_022', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_022';
      try {
        await getAVPlayerRequest(testName, url_1a1v_ts, (request: media.MediaSourceLoadingRequest) => {
          request.finishLoading(1,media.LoadingRequestError.LOADING_ERROR_SUCCESS);
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });
    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_023
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_023
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_023', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_023';
      try {
        await getAVPlayerRequest(testName, url_1a1v_ts, (request: media.MediaSourceLoadingRequest) => {
          request.finishLoading(1,media.LoadingRequestError.LOADING_ERROR_NO_RESOURCE);
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });
    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_024
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_024
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_024', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_024';
      try {
        await getAVPlayerRequest(testName, url_1a1v_ts, (request: media.MediaSourceLoadingRequest) => {
          request.finishLoading(1,media.LoadingRequestError.LOADING_ERROR_INVAID_HANDLE);
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });
    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_025
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_025
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_025', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_025';
      try {
        await getAVPlayerRequest(testName, url_1a1v_ts, (request: media.MediaSourceLoadingRequest) => {
          request.finishLoading(1,media.LoadingRequestError.LOADING_ERROR_ACCESS_TIMEOUT);
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });
    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_026
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_026
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_026', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_026';
      try {
        await getAVPlayerRequest(testName, url_1a1v_m3u8, (request: media.MediaSourceLoadingRequest) => {
          request.finishLoading(1,media.LoadingRequestError.LOADING_ERROR_NOT_READY);
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });
    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_027
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_027
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_027', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_027';
      try {
        await getAVPlayerRequest(testName, url_1a1v_m3u8, (request: media.MediaSourceLoadingRequest) => {
          request.finishLoading(1,media.LoadingRequestError.LOADING_ERROR_AUTHORIZE_FAILED);
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });
    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_028
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_028
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_028', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_028';
      try {
        await getAVPlayerRequest(testName, url_1a1v_m3u8, (request: media.MediaSourceLoadingRequest) => {
          request.finishLoading(1,media.LoadingRequestError.LOADING_ERROR_ACCESS_DENIED);
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });
    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_029
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_029
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_029', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_029';
      try {
        await getAVPlayerRequest(testName, url_1a1v_m3u8, (request: media.MediaSourceLoadingRequest) => {
          request.finishLoading(1,media.LoadingRequestError.LOADING_ERROR_SUCCESS);
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });
    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_030
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_030
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_030', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_030';
      try {
        await getAVPlayerRequest(testName, url_1a1v_m3u8, (request: media.MediaSourceLoadingRequest) => {
          request.finishLoading(1,media.LoadingRequestError.LOADING_ERROR_INVAID_HANDLE);
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });
    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_031
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_031
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_031', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_031';
      try {
        await getAVPlayerRequest(testName, url_1a1v_m3u8, (request: media.MediaSourceLoadingRequest) => {
          request.finishLoading(1,media.LoadingRequestError.LOADING_ERROR_NO_RESOURCE);
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });
    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_032
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_032
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_032', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_032';
      try {
        await getAVPlayerRequest(testName, url_1a1v_m3u8, (request: media.MediaSourceLoadingRequest) => {
          request.finishLoading(1,media.LoadingRequestError.LOADING_ERROR_ACCESS_TIMEOUT);
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });
    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_033
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_033
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_033', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_033';
      try {
        await getAVPlayerRequest(testName, url_1a1v_mpd, (request: media.MediaSourceLoadingRequest) => {
          request.finishLoading(1,media.LoadingRequestError.LOADING_ERROR_NOT_READY);
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });
    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_034
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_034
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_034', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_034';
      try {
        await getAVPlayerRequest(testName, url_1a1v_mpd, (request: media.MediaSourceLoadingRequest) => {
          request.finishLoading(1,media.LoadingRequestError.LOADING_ERROR_AUTHORIZE_FAILED);
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });
    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_035
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_035
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_035', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_035';
      try {
        await getAVPlayerRequest(testName, url_1a1v_mpd, (request: media.MediaSourceLoadingRequest) => {
          request.finishLoading(1,media.LoadingRequestError.LOADING_ERROR_ACCESS_DENIED);
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });
    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_036
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_036
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_036', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_036';
      try {
        await getAVPlayerRequest(testName, url_1a1v_mpd, (request: media.MediaSourceLoadingRequest) => {
          request.finishLoading(1,media.LoadingRequestError.LOADING_ERROR_SUCCESS);
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });
    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_037
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_037
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_037', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_037';
      try {
        await getAVPlayerRequest(testName, url_1a1v_mpd, (request: media.MediaSourceLoadingRequest) => {
          request.finishLoading(1,media.LoadingRequestError.LOADING_ERROR_INVAID_HANDLE);
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });
    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_038
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_038
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_038', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_038';
      try {
        await getAVPlayerRequest(testName, url_1a1v_mpd, (request: media.MediaSourceLoadingRequest) => {
          request.finishLoading(1,media.LoadingRequestError.LOADING_ERROR_NO_RESOURCE);
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });
    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_039
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_039
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_039', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_039';
      try {
        await getAVPlayerRequest(testName, url_1a1v_mpd, (request: media.MediaSourceLoadingRequest) => {
          request.finishLoading(1,media.LoadingRequestError.LOADING_ERROR_ACCESS_TIMEOUT);
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });
    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_040
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_040
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_040', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_040';
      try {
        AppStorage.setOrCreate('key', null);
        let header: Record<string, string> = AppStorage.get('key') as ESObject;
        await getAVPlayerRequest(testName, url_1a1v_m3u8, (request: media.MediaSourceLoadingRequest) => {
          request.respondHeader(1,header,'');
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });

    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_041
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_041
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_041', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_041';
      try {
        AppStorage.setOrCreate('key', undefined);
        let header: Record<string, string> = AppStorage.get('key') as ESObject;
        await getAVPlayerRequest(testName, url_1a1v_m3u8, (request: media.MediaSourceLoadingRequest) => {
          request.respondHeader(1,header,'');
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });

    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_042
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_042
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_042', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_042';
      try {
        AppStorage.setOrCreate('key', '');
        let header: Record<string, string> = AppStorage.get('key') as ESObject;
        await getAVPlayerRequest(testName, url_1a1v_m3u8, (request: media.MediaSourceLoadingRequest) => {
          request.respondHeader(1,header,'');
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });
    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_043
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_043
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_043', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_043';
      try {
        AppStorage.setOrCreate('key', null);
        let header: Record<string, string> = AppStorage.get('key') as ESObject;
        await getAVPlayerRequest(testName, url_1a1v_mpd, (request: media.MediaSourceLoadingRequest) => {
          request.respondHeader(1,header,'');
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });

    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_044
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_044
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_044', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_044';
      try {
        AppStorage.setOrCreate('key', undefined);
        let header: Record<string, string> = AppStorage.get('key') as ESObject;
        await getAVPlayerRequest(testName, url_1a1v_mpd, (request: media.MediaSourceLoadingRequest) => {
          request.respondHeader(1,header,'');
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });

    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_045
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_045
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_045', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_045';
      try {
        AppStorage.setOrCreate('key', '');
        let header: Record<string, string> = AppStorage.get('key') as ESObject;
        await getAVPlayerRequest(testName, url_1a1v_mpd, (request: media.MediaSourceLoadingRequest) => {
          request.respondHeader(1,header,'');
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });
    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_046
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_046
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_046', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_046';
      try {
        let header:Record<string, string> = {
          'Transfer-Encoding':'xxx',
          'Location' : 'xxx',
          'Content-Type' : 'xxx',
          'Content-Range' : 'xxx',
          'Content-Encode' : 'xxx',
          'Accept-Ranges' : 'xxx',
          'content-length' : 'xxx'
        };
        AppStorage.setOrCreate('key', null);
        let redirectUrl: string = AppStorage.get('key') as ESObject;
        await getAVPlayerRequest(testName, url_1a1v_ts, (request: media.MediaSourceLoadingRequest) => {
          request.respondHeader(1,header,redirectUrl);
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });
    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_047
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_047
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_047', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_047';
      try {
        let header:Record<string, string> = {
          'Transfer-Encoding':'xxx',
          'Location' : 'xxx',
          'Content-Type' : 'xxx',
          'Content-Range' : 'xxx',
          'Content-Encode' : 'xxx',
          'Accept-Ranges' : 'xxx',
          'content-length' : 'xxx'
        };
        AppStorage.setOrCreate('key', undefined);
        let redirectUrl: string = AppStorage.get('key') as ESObject;
        await getAVPlayerRequest(testName, url_1a1v_ts, (request: media.MediaSourceLoadingRequest) => {
          request.respondHeader(1,header,redirectUrl);
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });
    /**
     * @tc.number    MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_048
     * @tc.name      MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_048
     * @tc.desc      Testing RespondData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_048', Level.LEVEL0, async (done: Function) => {
      const  testName = 'MEDIA_KIT_MULTI_MEDIA_RESPOND_DATA_048';
      try {
        let header:Record<string, string> = {
          'Transfer-Encoding':'xxx',
          'Location' : 'xxx',
          'Content-Type' : 'xxx',
          'Content-Range' : 'xxx',
          'Content-Encode' : 'xxx',
          'Accept-Ranges' : 'xxx',
          'content-length' : 'xxx'
        };
        AppStorage.setOrCreate('key', '');
        let redirectUrl: string = AppStorage.get('key') as ESObject;
        await getAVPlayerRequest(testName, url_1a1v_ts, (request: media.MediaSourceLoadingRequest) => {
          request.respondHeader(1,header,redirectUrl);
          console.info(TAG,'SUCCEED',request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    });
  })
}


