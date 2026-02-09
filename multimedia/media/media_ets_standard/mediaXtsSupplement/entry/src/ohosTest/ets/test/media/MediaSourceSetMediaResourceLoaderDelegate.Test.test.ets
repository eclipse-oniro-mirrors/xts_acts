/*
 * Copyright (C) 2025-2025 Huawei Device Co., Ltd.
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
import media from '@ohos.multimedia.media'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { HashMap } from '@kit.ArkTS';


const TAG = 'MediaSourceSetMediaResourceLoaderDelegateTestSupp';


export default function MediaSourceSetMediaResourceLoaderDelegateTest() {
  describe('MediaSourceSetMediaResourceLoaderDelegateTest', () => {

    beforeAll(async () => {
      AppStorage.setOrCreate('emptyString','')
      console.info(TAG, 'beforeAll case.');
    });
    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });
    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });
    afterAll(() => {
      AppStorage.delete('emptyString')
      console.info(TAG, 'afterAll case.');
    });


    /**
     * @tc.number MEDIA_SOURCE_SET_MEDIA_RESOURCE_LOADER_DELEGATE_001
     * @tc.name   MEDIA_SOURCE_SET_MEDIA_RESOURCE_LOADER_DELEGATE_001
     * @tc.desc   第一个参数为null
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('MEDIA_SOURCE_SET_MEDIA_RESOURCE_LOADER_DELEGATE_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_SOURCE_SET_MEDIA_RESOURCE_LOADER_DELEGATE_001';
      try {
        let headers: Record<string, string> = {"User-Agent" : "User-Agent-Value"};
        console.info(TAG,testName,'headers')
        let mediaSource : media.MediaSource = media.createMediaSourceWithUrl("resource://rawfile/demo.mp4",  headers);
        console.info(TAG,testName,'mediaSource')
        let uuid: number = 1;
        console.info(TAG,testName,'uuid')
        let requests: HashMap<number, media.MediaSourceLoadingRequest> = new HashMap();
        console.info(TAG,testName,'requests')
        let sourceOpenCallback: media.SourceOpenCallback = (request: media.MediaSourceLoadingRequest) => {
          console.info(TAG,testName,'sourceOpenCallback')
          console.info(`Opening resource: ${request.url}`);
          uuid += 1;
          requests.set(uuid, request);
          return uuid;
        };
        let sourceReadCallback: media.SourceReadCallback = (uuid: number, requestedOffset: number, requestedLength: number) => {
          console.info(TAG,testName,'sourceReadCallback')
          console.info(`Reading resource with handle ${uuid}, offset: ${requestedOffset}, length: ${requestedLength}`);
        };
        let sourceCloseCallback: media.SourceCloseCallback = (uuid: number) => {
          console.info(TAG,testName,'sourceCloseCallback')
          console.info(`Closing resource with handle ${uuid}`);
          requests.remove(uuid);
        };
        let resourceLoader: media.MediaSourceLoader = { open: sourceOpenCallback, read: sourceReadCallback, close: sourceCloseCallback };
        console.info(TAG,testName,'resourceLoader')
        mediaSource.setMediaResourceLoaderDelegate(null);
        console.info(TAG,testName,'succeed setMediaResourceLoaderDelegate')
        done();
      } catch (error) {
        console.info(TAG, testName, ' mediaSource error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    });
    /**
     * @tc.number MEDIA_SOURCE_SET_MEDIA_RESOURCE_LOADER_DELEGATE_002
     * @tc.name   MEDIA_SOURCE_SET_MEDIA_RESOURCE_LOADER_DELEGATE_002
     * @tc.desc   第一个参数为undefined
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('MEDIA_SOURCE_SET_MEDIA_RESOURCE_LOADER_DELEGATE_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_SOURCE_SET_MEDIA_RESOURCE_LOADER_DELEGATE_002';
      try {
        let headers: Record<string, string> = {"User-Agent" : "User-Agent-Value"};
        console.info(TAG,testName,'headers')
        let mediaSource : media.MediaSource = media.createMediaSourceWithUrl("resource://rawfile/demo.mp4",  headers);
        console.info(TAG,testName,'mediaSource')
        let uuid: number = 1;
        console.info(TAG,testName,'uuid')
        let requests: HashMap<number, media.MediaSourceLoadingRequest> = new HashMap();
        console.info(TAG,testName,'requests')
        let sourceOpenCallback: media.SourceOpenCallback = (request: media.MediaSourceLoadingRequest) => {
          console.info(TAG,testName,'sourceOpenCallback')
          console.info(`Opening resource: ${request.url}`);
          uuid += 1;
          requests.set(uuid, request);
          return uuid;
        };
        let sourceReadCallback: media.SourceReadCallback = (uuid: number, requestedOffset: number, requestedLength: number) => {
          console.info(TAG,testName,'sourceReadCallback')
          console.info(`Reading resource with handle ${uuid}, offset: ${requestedOffset}, length: ${requestedLength}`);
        };
        let sourceCloseCallback: media.SourceCloseCallback = (uuid: number) => {
          console.info(TAG,testName,'sourceCloseCallback')
          console.info(`Closing resource with handle ${uuid}`);
          requests.remove(uuid);
        };
        let resourceLoader: media.MediaSourceLoader = { open: sourceOpenCallback, read: sourceReadCallback, close: sourceCloseCallback };
        console.info(TAG,testName,'resourceLoader')
        mediaSource.setMediaResourceLoaderDelegate(AppStorage.get('emptyString'));
        console.info(TAG,testName,'succeed setMediaResourceLoaderDelegate')
        done();
      } catch (error) {
        console.info(TAG, testName, ' mediaSource error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    });
    /**
     * @tc.number MEDIA_SOURCE_SET_MEDIA_RESOURCE_LOADER_DELEGATE_003
     * @tc.name   MEDIA_SOURCE_SET_MEDIA_RESOURCE_LOADER_DELEGATE_003
     * @tc.desc   第一个参数为空
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('MEDIA_SOURCE_SET_MEDIA_RESOURCE_LOADER_DELEGATE_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_SOURCE_SET_MEDIA_RESOURCE_LOADER_DELEGATE_003';
      try {
        let headers: Record<string, string> = {"User-Agent" : "User-Agent-Value"};
        console.info(TAG,testName,'headers')
        let mediaSource : media.MediaSource = media.createMediaSourceWithUrl("resource://rawfile/demo.mp4",  headers);
        console.info(TAG,testName,'mediaSource')
        let uuid: number = 1;
        console.info(TAG,testName,'uuid')
        let requests: HashMap<number, media.MediaSourceLoadingRequest> = new HashMap();
        console.info(TAG,testName,'requests')
        let sourceOpenCallback: media.SourceOpenCallback = (request: media.MediaSourceLoadingRequest) => {
          console.info(TAG,testName,'sourceOpenCallback')
          console.info(`Opening resource: ${request.url}`);
          uuid += 1;
          requests.set(uuid, request);
          return uuid;
        };
        let sourceReadCallback: media.SourceReadCallback = (uuid: number, requestedOffset: number, requestedLength: number) => {
          console.info(TAG,testName,'sourceReadCallback')
          console.info(`Reading resource with handle ${uuid}, offset: ${requestedOffset}, length: ${requestedLength}`);
        };
        let sourceCloseCallback: media.SourceCloseCallback = (uuid: number) => {
          console.info(TAG,testName,'sourceCloseCallback')
          console.info(`Closing resource with handle ${uuid}`);
          requests.remove(uuid);
        };
        let resourceLoader: media.MediaSourceLoader = { open: sourceOpenCallback, read: sourceReadCallback, close: sourceCloseCallback };
        console.info(TAG,testName,'resourceLoader')
        mediaSource.setMediaResourceLoaderDelegate(undefined);
        console.info(TAG,testName,'succeed setMediaResourceLoaderDelegate')
        done();
      } catch (error) {
        console.info(TAG, testName, ' mediaSource error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    });
  })
}
