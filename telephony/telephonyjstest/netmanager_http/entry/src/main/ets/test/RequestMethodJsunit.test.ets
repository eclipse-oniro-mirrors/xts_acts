/*
 * Copyright (C) 2021-2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect } from '@ohos/hypium';
import http from '@ohos.net.http';
import { BusinessError } from '@ohos.base';

let options_0100 = async (done: Function) => {
  let casename = 'SUB_Telephony_http_HttpRequestMethod_options_0100';
  console.log('-----------------------HttpRequestMethod_options Test is starting-----------------------');
  try {
    let httpRequestOptions: http.HttpRequestOptions = {
      method: http.RequestMethod.OPTIONS,
      header: 'content-type: application/json',
      readTimeout: 60000,
      connectTimeout: 60000
    };
    let httpRequest = http.createHttp();
    httpRequest.request('https://www.baidu.com/', httpRequestOptions, (err, data) => {
      console.log(casename + JSON.stringify(err) + ' data: ' + JSON.stringify(data));
      expect(data.responseCode == 200).assertTrue();
      httpRequest.destroy();
      console.log('-----------------------HttpRequestMethod_options Test end-----------------------');
      done();
    });
  }
  catch (error) {
    console.log('SUB_Telephony_http_HttpRequestMethod_options_0100 : error = ' + error);
    expect(false).assertTrue();
    done();
  }
};

let options_0200 = async (done: Function) => {
  let casename = 'SUB_Telephony_http_HttpRequestMethod_options_0200';
  console.log('-----------------------HttpRequestMethod_options_01 Test is starting-----------------------');
  try {
    let httpRequestOptions: http.HttpRequestOptions = {
      method: http.RequestMethod.OPTIONS,
      header: 'content-type: application/json',
      readTimeout: 60000,
      connectTimeout: 60000
    };
    let httpRequest = http.createHttp();
    httpRequest.request('https://www.baidu.com/', httpRequestOptions).then(data => {
      console.log(casename + JSON.stringify(data));
      expect(data.responseCode == 200).assertTrue();
      httpRequest.destroy();
      console.log('-----------------------HttpRequestMethod_options_01 Test end-----------------------');
      done();
    }).catch((error: BusinessError) => {
      console.info(casename + 'errocode' + JSON.stringify(error));
      expect(false).assertTrue();
      done();
    });
  }
  catch (error) {
    console.log('SUB_Telephony_http_HttpRequestMethod_options_0200 : error = ' + error);
    expect(false).assertTrue();
    done();
  }
};

let GET_0100 = async (done: Function) => {
  let casename = 'SUB_Telephony_http_HttpRequestMethod_GET_0100';
  console.log('-----------------------HttpRequestMethod_GET Test is starting-----------------------');
  try {
    let httpRequestOptions: http.HttpRequestOptions = {
      method: http.RequestMethod.GET,
      header: 'content-type: application/json',
      readTimeout: 60000,
      connectTimeout: 60000
    };
    let httpRequest = http.createHttp();
    httpRequest.request('https://www.baidu.com/', httpRequestOptions, (err, data) => {
      console.log(casename + JSON.stringify(err) + ' data: ' + JSON.stringify(data));
      expect(data.responseCode == 200).assertTrue();
      httpRequest.destroy();
      console.log('-----------------------HttpRequestMethod_GET Test end-----------------------');
      done();
    });
  }
  catch (error) {
    console.log('SUB_Telephony_http_HttpRequestMethod_GET_0100 : error = ' + error);
    expect(false).assertTrue();
    done();
  }
};

let GET_0200 = async (done: Function) => {
  let casename = 'SUB_Telephony_http_HttpRequestMethod_GET_0200';
  console.log('-----------------------HttpRequestMethod_GET_01 Test is starting-----------------------');
  try {
    let httpRequestOptions: http.HttpRequestOptions = {
      method: http.RequestMethod.GET,
      header: 'content-type: application/json',
      readTimeout: 60000,
      connectTimeout: 60000
    };
    let httpRequest = http.createHttp();
    httpRequest.request('https://www.baidu.com/', httpRequestOptions).then(data => {
      console.log(casename + JSON.stringify(data));
      expect(data.responseCode == 200).assertTrue();
      httpRequest.destroy();
      console.log('-----------------------HttpRequestMethod_GET_01 Test end-----------------------');
      done();
    }).catch((error: BusinessError) => {
      console.info(casename + 'errocode' + JSON.stringify(error));
      done();
    });
  }
  catch (error) {
    console.log('SUB_Telephony_http_HttpRequestMethod_GET_0200 : error = ' + error);
    expect(false).assertTrue();
    done();
  }
};

let POST_0100 = async (done: Function) => {
  let casename = 'SUB_Telephony_http_HttpRequestMethod_0300';
  console.log('-----------------------HttpRequestMethod_POST Test is starting-----------------------');
  try {
    let httpRequestOptions: http.HttpRequestOptions = {
      method: http.RequestMethod.POST,
      extraData: {
        tn: "albumsdetail",
        work: "渐变风格插画",
        fr: "albumslist",
        album_tab: "设计素材",
        album_id: "409",
        rn: "30"
      },
      header: 'content-type: application/json',
      readTimeout: 60000,
      connectTimeout: 60000
    }
    let httpRequest = http.createHttp();
    httpRequest.request('https://image.baidu.com/search/albumsdetail/', httpRequestOptions, (err, data) => {
      console.log(casename + JSON.stringify(err) + ' data: ' + JSON.stringify(data));
      expect(data.responseCode == 200).assertTrue();
      httpRequest.destroy();
      console.log('-----------------------HttpRequestMethod_POST Test end-----------------------');
      done();
    });
  }
  catch (error) {
    console.log('SUB_Telephony_http_HttpRequestMethod_POST_0100 : error = ' + error);
    expect(false).assertTrue();
    done();
  }
};

let POST_0200 = async (done: Function) => {
  let casename = 'SUB_Telephony_http_HttpRequestMethod_POST_0200'
  console.log('-----------------------HttpRequestMethod_POST_01 Test is starting-----------------------');
  try {
    let httpRequestOptions: http.HttpRequestOptions = {
      method: http.RequestMethod.POST,
      extraData: {
        tn: "albumsdetail",
        work: "渐变风格插画",
        fr: "albumslist",
        album_tab: "设计素材",
        album_id: "409",
        rn: "30"
      },
      header: 'content-type: application/json',
      readTimeout: 60000,
      connectTimeout: 60000
    }
    let httpRequest = http.createHttp();
    httpRequest.request('https://image.baidu.com/search/albumsdetail/', httpRequestOptions).then(data => {
      console.log(casename + JSON.stringify(data));
      expect(data.responseCode == 200).assertTrue();
      httpRequest.destroy();
      console.log('-----------------------HttpRequestMethod_POST_01 Test end-----------------------');
      done();
    }).catch((error: BusinessError) => {
      console.info(casename + 'errocode' + JSON.stringify(error));
      expect(false).assertTrue();
      done();
    });
  } catch (error) {
    console.log('SUB_Telephony_http_HttpRequestMethod_POST_0200 : error = ' + error);
    expect(false).assertTrue();
    done();
  }
};

let TRACE_0100 = async (done: Function) => {
  let casename = 'SUB_Telephony_http_HttpRequestMethod_TRACE_0100';
  console.log('-----------------------HttpRequestMethod_TRACE Test is starting-----------------------');
  try {
    let httpRequestOptions: http.HttpRequestOptions = {
      method: http.RequestMethod.TRACE,
      header: 'content-type: application/json',
      readTimeout: 60000,
      connectTimeout: 60000
    };
    let httpRequest = http.createHttp();
    httpRequest.request('https://www.baidu.com/', httpRequestOptions, (err, data) => {
      console.log(casename + JSON.stringify(err) + ' data: ' + JSON.stringify(data));
      expect(data.responseCode == 200).assertTrue();
      httpRequest.destroy();
      console.log('-----------------------HttpRequestMethod_TRACE Test end-----------------------');
      done();
    });
  }
  catch (error) {
    console.log('SUB_Telephony_http_HttpRequestMethod_TRACE_0100 : error = ' + error);
    expect(false).assertTrue();
    done();
  }
};

let TRACE_0200 = async (done: Function) => {
  let casename = 'SUB_Telephony_http_HttpRequestMethod_TRACE_0200';
  console.log('-----------------------HttpRequestMethod_TRACE_01 Test is starting-----------------------');
  try {
    let httpRequestOptions: http.HttpRequestOptions = {
      method: http.RequestMethod.TRACE,
      header: 'content-type: application/json',
      readTimeout: 60000,
      connectTimeout: 60000
    };
    let httpRequest = http.createHttp();
    httpRequest.request('https://www.baidu.com/', httpRequestOptions).then(data => {
      console.log(casename + JSON.stringify(data));
      expect(data.responseCode == 200).assertTrue();
      httpRequest.destroy();
      console.log('-----------------------HttpRequestMethod_TRACE_01 Test end-----------------------');
      done();
    }).catch((error: BusinessError) => {
      console.info(casename + 'errocode' + JSON.stringify(error));
      expect(false).assertTrue();
      done();
    });
  }
  catch (error) {
    console.log('SUB_Telephony_http_HttpRequestMethod_TRACE_0200 : error = ' + error);
    expect(false).assertTrue();
    done();
  }
};

let PUT_0100 = async (done: Function) => {
  let casename = 'SUB_Telephony_http_HttpRequestMethod_PUT_0100';
  console.log('-----------------------HttpRequestMethod_PUT Test is starting-----------------------');
  try {
    let httpRequestOptions: http.HttpRequestOptions = {
      method: http.RequestMethod.PUT,
      header: 'content-type: application/json',
      readTimeout: 60000,
      connectTimeout: 60000
    };
    if (httpRequestOptions.method == http.RequestMethod.PUT) {
      done();
      return;
    }
    let httpRequest = http.createHttp();
    httpRequest.request('https://www.baidu.com/', httpRequestOptions, (err, data) => {
      console.log(casename + JSON.stringify(err) + ' data: ' + JSON.stringify(data));
      expect(data.responseCode == 200).assertTrue();
      httpRequest.destroy();
      console.log('-----------------------HttpRequestMethod_PUT Test end-----------------------');
      done();
    });
  }
  catch (error) {
    console.log('SUB_Telephony_http_HttpRequestMethod_PUT_0100 : error = ' + error);
    expect(false).assertTrue();
    done();
  }
};

let PUT_0200 = async (done: Function) => {
  let casename = 'SUB_Telephony_http_HttpRequestMethod_PUT_0200';
  console.log('-----------------------HttpRequestMethod_PUT_01 Test is starting-----------------------');
  try {
    let httpRequestOptions: http.HttpRequestOptions = {
      method: http.RequestMethod.PUT,
      header: 'content-type: application/json',
      readTimeout: 60000,
      connectTimeout: 60000
    };
    if (httpRequestOptions.method == http.RequestMethod.PUT) {
      done();
      return;
    }
    let httpRequest = http.createHttp();
    httpRequest.request('https://www.baidu.com/', httpRequestOptions).then(data => {
      console.log(casename + JSON.stringify(data));
      expect(data.responseCode == 200).assertTrue();
      httpRequest.destroy();
      console.log('-----------------------HttpRequestMethod_PUT_01 Test end-----------------------');
      done();
    }).catch((error: BusinessError) => {
      console.info(casename + 'errocode' + JSON.stringify(error));
      expect(false).assertTrue();
      done();
    });
  }
  catch (error) {
    console.log('SUB_Telephony_http_HttpRequestMethod_PUT_0200 : error = ' + error);
    expect(false).assertTrue();
    done();
  }
};

let head_0100 = async (done: Function) => {
  let casename = 'SUB_Telephony_http_HttpRequestMethod_head_0100';
  console.log('-----------------------HttpRequestMethod_head Test is starting-----------------------');
  try {
    let httpRequestOptions: http.HttpRequestOptions = {
      method: http.RequestMethod.HEAD,
      header: 'content-type: application/json',
      readTimeout: 60000,
      connectTimeout: 60000
    };
    let httpRequest = http.createHttp();
    httpRequest.request('https://www.baidu.com/', httpRequestOptions, (err, data) => {
      console.log(casename + JSON.stringify(err) + ' data: ' + JSON.stringify(data));
      expect(data.responseCode == 200).assertTrue();
      httpRequest.destroy();
      console.log('-----------------------HttpRequestMethod_head Test end-----------------------');
      done();
    });
  }
  catch (error) {
    console.log('SUB_Telephony_http_HttpRequestMethod_head_0100 : error = ' + error);
    expect(false).assertTrue();
    done();
  }
};

let HEAD_0200 = async (done: Function) => {
  let casename = 'SUB_Telephony_http_HttpRequestMethod_HEAD_0200';
  console.log('-----------------------HttpRequestMethod_HEAD_01 Test is starting-----------------------');
  try {
    let httpRequestOptions: http.HttpRequestOptions = {
      method: http.RequestMethod.HEAD,
      header: 'content-type: application/json',
      readTimeout: 60000,
      connectTimeout: 60000
    };
    let httpRequest = http.createHttp();
    httpRequest.request('https://www.baidu.com/', httpRequestOptions).then(data => {
      console.log(casename + JSON.stringify(data));
      expect(data.responseCode == 200).assertTrue();
      httpRequest.destroy();
      console.log('-----------------------HttpRequestMethod_HEAD_01 Test end-----------------------');
      done();
    }).catch((error: BusinessError) => {
      console.info(casename + 'errocode' + JSON.stringify(error));
      expect(false).assertTrue();
      done();
    });
  }
  catch (error) {
    console.log('SUB_Telephony_http_HttpRequestMethod_HEAD_0200 : error = ' + error);
    expect(false).assertTrue();
    done();
  }
};

let DELETE_0100 = async (done: Function) => {
  let casename = 'SUB_Telephony_http_HttpRequestMethod_DELETE_0100';
  console.log('-----------------------HttpRequestMethod_DELETE Test is starting-----------------------');
  try {
    let httpRequestOptions: http.HttpRequestOptions = {
      method: http.RequestMethod.DELETE,
      header: 'content-type: application/json',
      readTimeout: 60000,
      connectTimeout: 60000
    };
    let httpRequest = http.createHttp();
    httpRequest.request('https://www.openharmony.cn/', httpRequestOptions, (err, data) => {
      console.log(casename + JSON.stringify(err) + ' data: ' + JSON.stringify(data));
      expect(data.responseCode == 405).assertTrue();
      httpRequest.destroy();
      console.log('-----------------------HttpRequestMethod_DELETE Test end-----------------------');
      done();
    });
  }
  catch (error) {
    console.log('SUB_Telephony_http_HttpRequestMethod_DELETE_0100 : error = ' + error);
    expect(false).assertTrue();
    done();
  }
};

let DELETE_0200 = async (done: Function) => {
  let casename = 'SUB_Telephony_http_HttpRequestMethod_DELETE_0200';
  console.log('-----------------------HttpRequestMethod_DELETE_01 Test is starting-----------------------');
  try {
    let httpRequestOptions: http.HttpRequestOptions = {
      method: http.RequestMethod.DELETE,
      header: 'content-type: application/json',
      readTimeout: 60000,
      connectTimeout: 60000
    };
    let httpRequest = http.createHttp();
    httpRequest.request('https://www.openharmony.cn/', httpRequestOptions).then(data => {
      console.log(casename + JSON.stringify(data));
      expect(data.responseCode == 405).assertTrue();
      httpRequest.destroy();
      console.log('-----------------------HttpRequestMethod_DELETE_01 Test end-----------------------');
      done();
    }).catch((error: BusinessError) => {
      console.info(casename + 'errocode' + JSON.stringify(error));
      expect(false).assertTrue();
      done();
    });
  }
  catch (error) {
    console.log('SUB_Telephony_http_HttpRequestMethod_DELETE_0200 : error = ' + error);
    expect(false).assertTrue();
    done();
  }
};

let CONNECT_0100 = async (done: Function) => {
  let casename = 'SUB_Telephony_http_HttpRequestMethod_CONNECT_0100';
  console.log('-----------------------HttpRequestMethod_CONNECT Test is starting-----------------------');
  try {
    let httpRequestOptions: http.HttpRequestOptions = {
      method: http.RequestMethod.CONNECT,
      header: 'content-type: application/json',
      readTimeout: 60000,
      connectTimeout: 60000
    };
    let httpRequest = http.createHttp();
    httpRequest.request('https://www.baidu.com/', httpRequestOptions, (err, data) => {
      console.log(casename + JSON.stringify(err) + ' data: ' + JSON.stringify(data));
      expect(data.responseCode == 200).assertTrue();
      httpRequest.destroy();
      console.log('-----------------------HttpRequestMethod_CONNECT Test end-----------------------');
      done();
    });
  }
  catch (error) {
    console.log('SUB_Telephony_http_HttpRequestMethod_CONNECT_0100 : error = ' + error);
    expect(false).assertTrue();
    done();
  }
};

let CONNECT_0200 = async (done: Function) => {
  let casename = 'SUB_Telephony_http_HttpRequestMethod_CONNECT_0200';
  console.log('-----------------------HttpRequestMethod_CONNECT_01 Test is starting-----------------------');
  try {
    let httpRequestOptions: http.HttpRequestOptions = {
      method: http.RequestMethod.CONNECT,
      header: 'content-type: application/json',
      readTimeout: 60000,
      connectTimeout: 60000
    };
    let httpRequest = http.createHttp();
    httpRequest.request('https://www.baidu.com/', httpRequestOptions).then(data => {
      console.log(casename + JSON.stringify(data));
      expect(data.responseCode == 200).assertTrue();
      httpRequest.destroy();
      console.log('-----------------------HttpRequestMethod_CONNECT_01 Test end-----------------------');
      done();
    }).catch((error: BusinessError) => {
      console.info(casename + 'errocode' + JSON.stringify(error));
      expect(false).assertTrue();
      done();
    });
  }
  catch (error) {
    console.log('SUB_Telephony_http_HttpRequestMethod_CONNECT_0200 : error = ' + error);
    expect(false).assertTrue();
    done();
  }
};

export default function requestMethodJsunit() {
  describe('requestMethodJsunit', () => {
    /**
     * @tc.number SUB_Telephony_http_HttpRequestMethod_options_0100
     * @tc.name testHttpRequestMethodOptionsAsync
     * @tc.desc Test Test HttpRequestMethod property.
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_http_HttpRequestMethod_options_0100', 0, options_0100);

    /**
     * @tc.number SUB_Telephony_http_HttpRequestMethod_options_0200
     * @tc.name testHttpRequestMethodOptionsPromise
     * @tc.desc Test Test HttpRequestMethod property.
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_http_HttpRequestMethod_options_0200', 0, options_0200);

    /**
     * @tc.number SUB_Telephony_http_HttpRequestMethod_GET_0100
     * @tc.name testHttpRequestMethodGetAsync
     * @tc.desc Test Test HttpRequestMethod property.
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_http_HttpRequestMethod_GET_0100', 0, GET_0100);

    /**
     * @tc.number SUB_Telephony_http_HttpRequestMethod_GET_0200
     * @tc.name testHttpRequestMethodGetPromise
     * @tc.desc Test Test HttpRequestMethod property.
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_http_HttpRequestMethod_GET_0200', 0, GET_0200);

    /**
     * @tc.number SUB_Telephony_http_HttpRequestMethod_POST_0100
     * @tc.name testHttpRequestMethodPostAsync
     * @tc.desc Test Test HttpRequestMethod property.
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_http_HttpRequestMethod_POST_0100', 0, POST_0100);

    /**
     * @tc.number SUB_Telephony_http_HttpRequestMethod_POST_0200
     * @tc.name testHttpRequestMethodPostPromise
     * @tc.desc Test Test HttpRequestMethod property.
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_http_HttpRequestMethod_POST_0200', 0, POST_0200);

    /**
     * @tc.number SUB_Telephony_http_HttpRequestMethod_TRACE_0100
     * @tc.name testHttpRequestMethodTraceAsync
     * @tc.desc Test Test HttpRequestMethod property.
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_http_HttpRequestMethod_TRACE_0100', 0, TRACE_0100);

    /**
     * @tc.number SUB_Telephony_http_HttpRequestMethod_TRACE_0200
     * @tc.name testHttpRequestMethodTracePromise
     * @tc.desc Test Test HttpRequestMethod property.
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_http_HttpRequestMethod_TRACE_0200', 0, TRACE_0200);

    /**
     * @tc.number SUB_Telephony_http_HttpRequestMethod_PUT_0100
     * @tc.name testHttpRequestMethodPutAsync
     * @tc.desc Test Test HttpRequestMethod property.
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_http_HttpRequestMethod_PUT_0100', 0, PUT_0100);

    /**
     * @tc.number SUB_Telephony_http_HttpRequestMethod_PUT_0200
     * @tc.name testHttpRequestMethodPutPromise
     * @tc.desc Test Test HttpRequestMethod property.
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_http_HttpRequestMethod_PUT_0200', 0, PUT_0200);

    /**
     * @tc.number SUB_Telephony_http_HttpRequestMethod_head_0100
     * @tc.name testHttpRequestMethodHeadAsync
     * @tc.desc Test Test HttpRequestMethod property.
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_http_HttpRequestMethod_head_0100', 0, head_0100);

    /**
     * @tc.number SUB_Telephony_http_HttpRequestMethod_HEAD_0200
     * @tc.name testHttpRequestMethodHeadPromise
     * @tc.desc Test Test HttpRequestMethod property.
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_http_HttpRequestMethod_HEAD_0200', 0, HEAD_0200);

    /**
     * @tc.number SUB_Telephony_http_HttpRequestMethod_DELETE_0100
     * @tc.name testHttpRequestMethodDeleteAsync
     * @tc.desc Test Test HttpRequestMethod property.
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_http_HttpRequestMethod_DELETE_0100', 0, DELETE_0100);

    /**
     * @tc.number SUB_Telephony_http_HttpRequestMethod_DELETE_0200
     * @tc.name testHttpRequestMethodDeletePromise
     * @tc.desc Test Test HttpRequestMethod property.
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_http_HttpRequestMethod_DELETE_0200', 0, DELETE_0200);

    /**
     * @tc.number SUB_Telephony_http_HttpRequestMethod_CONNECT_0100
     * @tc.name testHttpRequestMethodConnectAsync
     * @tc.desc Test Test HttpRequestMethod property.
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_http_HttpRequestMethod_CONNECT_0100', 0, CONNECT_0100);

    /**
     * @tc.number SUB_Telephony_http_HttpRequestMethod_CONNECT_0200
     * @tc.name testHttpRequestMethodConnectPromise
     * @tc.desc Test Test HttpRequestMethod property.
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_http_HttpRequestMethod_CONNECT_0200', 0, CONNECT_0200);
  })
};