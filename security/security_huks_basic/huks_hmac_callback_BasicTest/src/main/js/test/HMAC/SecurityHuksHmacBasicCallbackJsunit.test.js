/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

import { describe, it, expect } from "@ohos/hypium";
import huks from "@ohos.security.huks";
import Data from "../../../../../../utils/data.json";
import { HuksHmac } from "../../../../../../utils/param/hmac/publicHmacParam.js";
import { stringToArray } from "../../../../../../utils/param/publicFunc.js";

var handle;
let srcData63Kb = Data.Date63KB;
let srcData65Kb = Data.Date65KB;

function generateKey(srcKeyAlies, HuksOptions) {
  return new Promise((resolve, reject) => {
    huks.generateKey(srcKeyAlies, HuksOptions, function (err, data) {
      try {
        if (err.code !== 0) {
          console.log(
            "test generateKey err information: " + JSON.stringify(err)
          );
          reject(err);
        } else {
          resolve(data);
        }
      } catch (e) {
        console.log("test generateKey err information: " + JSON.stringify(e));
        reject(e);
      }
    });
  });
}

function init(srcKeyAlies, HuksOptions) {
  return new Promise((resolve, reject) => {
    huks.init(srcKeyAlies, HuksOptions, function (err, data) {
      try {
        if (err.code !== 0) {
          console.log("test init err information: " + JSON.stringify(err));
          reject(err);
        } else {
          handle = data.handle;
          resolve(data);
        }
      } catch (e) {
        console.log("test init err information: " + JSON.stringify(e));
        reject(e);
      }
    });
  });
}

function update(handle, HuksOptions) {
  return new Promise((resolve, reject) => {
    huks.update(handle, HuksOptions, function (err, data) {
      try {
        if (err.code !== 0) {
          console.log("test update err information: " + JSON.stringify(err));
          reject(err);
        } else {
          resolve(data);
        }
      } catch (e) {
        console.log("test update err information: " + JSON.stringify(e));
        reject(e);
      }
    });
  });
}

function finish(handle, HuksOptions) {
  return new Promise((resolve, reject) => {
    huks.finish(handle, HuksOptions, function (err, data) {
      try {
        if (err.code !== 0) {
          console.log("test finish err information: " + JSON.stringify(err));
          reject(err);
        } else {
          resolve(data);
        }
      } catch (e) {
        console.log("test finish err information: " + JSON.stringify(e));
        reject(e);
      }
    });
  });
}

function abort(handle, HuksOptions) {
  return new Promise((resolve, reject) => {
    huks.abort(handle, HuksOptions, function (err, data) {
      try {
        if (err.code !== 0) {
          console.log("test abort err information: " + JSON.stringify(err));
          reject(err);
        } else {
          resolve(data);
        }
      } catch (e) {
        console.log("test abort err information: " + JSON.stringify(e));
        reject(e);
      }
    });
  });
}

function deleteKey(srcKeyAlies, HuksOptions) {
  return new Promise((resolve, reject) => {
    huks.deleteKey(srcKeyAlies, HuksOptions, function (err, data) {
      try {
        if (err.code !== 0) {
          console.log("test deleteKey err information: " + JSON.stringify(err));
          reject(err);
        } else {
          resolve(data);
        }
      } catch (e) {
        console.log("test deleteKey err information: " + JSON.stringify(e));
        reject(e);
      }
    });
  });
}

async function publicHmacUpdate(HuksOptions) {
  let dateSize = 64 * 1024;
  let huksOptionsInData = HuksOptions.inData;
  let inDataArray = stringToArray(HuksOptions.inData);

  if (HuksOptions.inData.length <= dateSize) {
    HuksOptions.inData = new Uint8Array(inDataArray);
    await update(handle, HuksOptions)
      .then((data) => {
        console.log(`test update data: ${data}`);
      })
      .catch((err) => {
        console.log("test update err information: " + JSON.stringify(err));
        expect(null).assertFail();
      });
    HuksOptions.inData = huksOptionsInData;
  } else {
    let count = Math.floor(inDataArray.length / dateSize);
    let remainder = inDataArray.length % dateSize;
    for (let i = 0; i < count; i++) {
      HuksOptions.inData = new Uint8Array(
        stringToArray(huksOptionsInData).slice(dateSize * i, dateSize * (i + 1))
      );
      await update(handle, HuksOptions)
        .then((data) => {
          console.log(`test update data: ${data}`);
        })
        .catch((err) => {
          console.log("test update err information: " + JSON.stringify(err));
          expect(null).assertFail();
        });
    }
    if (remainder !== 0) {
      HuksOptions.inData = new Uint8Array(
        stringToArray(huksOptionsInData).slice(
          dateSize * count,
          inDataArray.length
        )
      );
      console.log(`test update HuksOptions.inData ${HuksOptions.inData}`);
      await update(handle, HuksOptions)
        .then((data) => {
          console.log(`test update data: ${data}`);
        })
        .catch((err) => {
          console.log("test update err information: " + JSON.stringify(err));
          expect(null).assertFail();
        });
    }
  }
}

async function publicHmacGenFunc(srcKeyAlies, HuksOptions, thirdInderfaceName) {
  HuksOptions.properties.splice(1, 0, HuksHmac.HuksKeySIZE);
  await generateKey(srcKeyAlies, HuksOptions)
    .then((data) => {
      console.log("test generateKey data = " + JSON.stringify(data));
    })
    .catch((err) => {
      console.log(`test init err: " + ${JSON.stringify(err)}`);
      expect(null).assertFail();
    });

  HuksOptions.properties.splice(1, 1);
  await init(srcKeyAlies, HuksOptions)
    .then((data) => {
      console.log(`test init data: ${JSON.stringify(data)}`);
    })
    .catch((err) => {
      console.log(`test init err: " + ${JSON.stringify(err)}`);
      expect(null).assertFail();
    });
  await publicHmacUpdate(HuksOptions);

  if (thirdInderfaceName == "finish") {
    HuksOptions.inData = new Uint8Array(stringToArray("0"));
    await finish(handle, HuksOptions)
      .then((data) => {
        console.log(`test update data: ${data}`);
      })
      .catch((err) => {
        console.log("test update err information: " + JSON.stringify(err));
        expect(null).assertFail();
      });
  } else {
    await abort(handle, HuksOptions)
      .then((data) => {
        console.log(`test abort data: ${data}`);
      })
      .catch((err) => {
        console.log("test abort err information: " + JSON.stringify(err));
        expect(null).assertFail();
      });
  }
  HuksOptions.properties.splice(1, 0, HuksHmac.HuksKeySIZE);
  await deleteKey(srcKeyAlies, HuksOptions)
    .then((data) => {
      console.log(`test deleteKey data: ${data}`);
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log("test deleteKey err information: " + JSON.stringify(err));
      expect(null).assertFail();
    });
}

export function SecurityHuksHmacCallbackJsunit() {
  describe("SecurityHuksHmacCallbackJsunit", function () {
    it("testHmacSHA1001", 0, async function (done) {
      let srcKeyAlies = "testHmacDigestSHA256KeyAlias001";
      let HuksOptions = {
        properties: new Array(
          HuksHmac.HuksKeyAlg,
          HuksHmac.HuksKeyPurpose,
          HuksHmac.HuksTagDigestSHA256
        ),
        inData: srcData63Kb,
      };

      await publicHmacGenFunc(srcKeyAlies, HuksOptions, "finish");
      done();
    });

    it("testHmacSHA1002", 0, async function (done) {
      let srcKeyAlies = "testHmacDigestSHA256KeyAlias002";
      let HuksOptions = {
        properties: new Array(
          HuksHmac.HuksKeyAlg,
          HuksHmac.HuksKeyPurpose,
          HuksHmac.HuksTagDigestSHA256
        ),
        inData: srcData63Kb,
      };
      await publicHmacGenFunc(srcKeyAlies, HuksOptions, "abort");
      done();
    });
    it("testHmacSHA1003", 0, async function (done) {
      let srcKeyAlies = "testHmacDigestSHA256KeyAlias003";
      let HuksOptions = {
        properties: new Array(
          HuksHmac.HuksKeyAlg,
          HuksHmac.HuksKeyPurpose,
          HuksHmac.HuksTagDigestSHA256
        ),
        inData: srcData65Kb,
      };
      await publicHmacGenFunc(srcKeyAlies, HuksOptions, "finish");
      done();
    });
    it("testHmacSHA1004", 0, async function (done) {
      let srcKeyAlies = "testHmacDigestSHA256KeyAlias004";
      let HuksOptions = {
        properties: new Array(
          HuksHmac.HuksKeyAlg,
          HuksHmac.HuksKeyPurpose,
          HuksHmac.HuksTagDigestSHA256
        ),
        inData: srcData65Kb,
      };
      await publicHmacGenFunc(srcKeyAlies, HuksOptions, "abort");
      done();
    });
    it("testHmacSM3001", 0, async function (done) {
      let srcKeyAlies = "testHmacDigestSM3KeyAlias001";
      let HuksOptions = {
        properties: new Array(
          HuksHmac.HuksKeyAlg,
          HuksHmac.HuksKeyPurpose,
          HuksHmac.HuksTagDigestSM3
        ),
        inData: srcData63Kb,
      };

      await publicHmacGenFunc(srcKeyAlies, HuksOptions, "finish");
      done();
    });

    it("testHmacSM3002", 0, async function (done) {
      let srcKeyAlies = "testHmacDigestSM3KeyAlias002";
      let HuksOptions = {
        properties: new Array(
          HuksHmac.HuksKeyAlg,
          HuksHmac.HuksKeyPurpose,
          HuksHmac.HuksTagDigestSM3
        ),
        inData: srcData63Kb,
      };
      await publicHmacGenFunc(srcKeyAlies, HuksOptions, "abort");
      done();
    });
    it("testHmacSM3003", 0, async function (done) {
      let srcKeyAlies = "testHmacDigestSM3KeyAlias003";
      let HuksOptions = {
        properties: new Array(
          HuksHmac.HuksKeyAlg,
          HuksHmac.HuksKeyPurpose,
          HuksHmac.HuksTagDigestSM3
        ),
        inData: srcData65Kb,
      };
      await publicHmacGenFunc(srcKeyAlies, HuksOptions, "finish");
      done();
    });
    it("testHmacSM3004", 0, async function (done) {
      let srcKeyAlies = "testHmacDigestSM3KeyAlias004";
      let HuksOptions = {
        properties: new Array(
          HuksHmac.HuksKeyAlg,
          HuksHmac.HuksKeyPurpose,
          HuksHmac.HuksTagDigestSM3
        ),
        inData: srcData65Kb,
      };
      await publicHmacGenFunc(srcKeyAlies, HuksOptions, "abort");
      done();
    });
  });
}
