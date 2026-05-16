/*
* Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { afterEach, describe, expect, it, Level } from '@ohos/hypium';
import document from '@ohos.document';

export default function documentShowTest() {
describe("documentShowTest", () => {
    afterEach(async () => {
    // Cleanup if needed
    })

    /**
     * @tc.name   test_document_show_callback_000
     * @tc.number SUB_STORAGE_DOCUMENT_SHOW_CALLBACK_0000
     * @tc.desc   test show function with normal parameters and callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_document_show_callback_000", Level.LEVEL1, async (done) => {
    let testNum = "test_document_show_callback_000";
    try {
        let uri = "file://docs/storage/Users/currentUser/test/test.txt";
        let type = "text/plain";
        document.show(uri, type, (err) => {
        if (err) {
            console.info(`${testNum}::show err: ${err.message}`);
            expect(err.message == "error").assertTrue();
        } else {
            console.info(`${testNum}::show success`);
            expect(false).assertTrue();
        }
        done();
        });
    } catch (error) {
        console.info(`${testNum}::show error: ${error.message}`);
        expect(error.message == "error").assertTrue();
        done();
    }
    });

    /**
     * @tc.name   test_document_show_callback_001
     * @tc.number SUB_STORAGE_DOCUMENT_SHOW_CALLBACK_0100
     * @tc.desc   test show function with empty string uri and callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_document_show_callback_001", Level.LEVEL1, async (done) => {
    let testNum = "test_document_show_callback_001";
    try {
        let uri = "";
        let type = "text/plain";
        document.show(uri, type, (err) => {
        if (err) {
            console.info(`${testNum}::show err: ${err.message}`);
            expect(err.message == "error").assertTrue();
        } else {
            console.info(`${testNum}::show success`);
            expect(false).assertTrue();
        }
        done();
        });
    } catch (error) {
        console.info(`${testNum}::show error: ${error.message}`);
        expect(error.message == "error").assertTrue();
        done();
    }
    });

    /**
     * @tc.name   test_document_show_callback_002
     * @tc.number SUB_STORAGE_DOCUMENT_SHOW_CALLBACK_0200
     * @tc.desc   test show function with null uri and callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_document_show_callback_002", Level.LEVEL1, async (done) => {
    let testNum = "test_document_show_callback_002";
    try {
        let uri = null;
        let type = "text/plain";
        document.show(uri, type, (err) => {
        if (err) {
            console.info(`${testNum}::show err: ${err.message}`);
            expect(err.message == "error").assertTrue();
        } else {
            console.info(`${testNum}::show success`);
            expect(false).assertTrue();
        }
        done();
        });
    } catch (error) {
        console.info(`${testNum}::show error: ${error.message}`);
        expect(error.message == "error").assertTrue();
        done();
    }
    });

    /**
     * @tc.name   test_document_show_callback_003
     * @tc.number SUB_STORAGE_DOCUMENT_SHOW_CALLBACK_0300
     * @tc.desc   test show function with undefined uri and callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_document_show_callback_003", Level.LEVEL1, async (done) => {
    let testNum = "test_document_show_callback_003";
    try {
        let uri = undefined;
        let type = "text/plain";
        document.show(uri, type, (err) => {
        if (err) {
            console.info(`${testNum}::show err: ${err.message}`);
            expect(err.message == "error").assertTrue();
        } else {
            console.info(`${testNum}::show success`);
            expect(false).assertTrue();
        }
        done();
        });
    } catch (error) {
        console.info(`${testNum}::show error: ${error.message}`);
        expect(error.message == "error").assertTrue();
        done();
    }
    });

    /**
     * @tc.name   test_document_show_callback_004
     * @tc.number SUB_STORAGE_DOCUMENT_SHOW_CALLBACK_0400
     * @tc.desc   test show function with empty string type and callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_document_show_callback_004", Level.LEVEL1, async (done) => {
    let testNum = "test_document_show_callback_004";
    try {
        let uri = "file://docs/storage/Users/currentUser/test/test.txt";
        let type = "";
        document.show(uri, type, (err) => {
        if (err) {
            console.info(`${testNum}::show err: ${err.message}`);
            expect(err.message == "error").assertTrue();
        } else {
            console.info(`${testNum}::show success`);
            expect(false).assertTrue();
        }
        done();
        });
    } catch (error) {
        console.info(`${testNum}::show error: ${error.message}`);
        expect(error.message == "error").assertTrue();
        done();
    }
    });

    /**
     * @tc.name   test_document_show_callback_005
     * @tc.number SUB_STORAGE_DOCUMENT_SHOW_CALLBACK_0500
     * @tc.desc   test show function with null type and callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_document_show_callback_005", Level.LEVEL1, async (done) => {
    let testNum = "test_document_show_callback_005";
    try {
        let uri = "file://docs/storage/Users/currentUser/test/test.txt";
        let type = null;
        document.show(uri, type, (err) => {
        if (err) {
            console.info(`${testNum}::show err: ${err.message}`);
            expect(err.message == "error").assertTrue();
        } else {
            console.info(`${testNum}::show success`);
            expect(false).assertTrue();
        }
        done();
        });
    } catch (error) {
        console.info(`${testNum}::show error: ${error.message}`);
        expect(error.message == "error").assertTrue();
        done();
    }
    });

    /**
     * @tc.name   test_document_show_callback_006
     * @tc.number SUB_STORAGE_DOCUMENT_SHOW_CALLBACK_0600
     * @tc.desc   test show function with undefined type and callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_document_show_callback_006", Level.LEVEL1, async (done) => {
    let testNum = "test_document_show_callback_006";
    try {
        let uri = "file://docs/storage/Users/currentUser/test/test.txt";
        let type = undefined;
        document.show(uri, type, (err) => {
        if (err) {
            console.info(`${testNum}::show err: ${err.message}`);
            expect(err.message == "error").assertTrue();
        } else {
            console.info(`${testNum}::show success`);
            expect(false).assertTrue();
        }
        done();
        });
    } catch (error) {
        console.info(`${testNum}::show error: ${error.message}`);
        expect(error.message == "error").assertTrue();
        done();
    }
    });

    /**
     * @tc.name   test_document_show_callback_007
     * @tc.number SUB_STORAGE_DOCUMENT_SHOW_CALLBACK_0700
     * @tc.desc   test show function with both empty string parameters and callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_document_show_callback_007", Level.LEVEL1, async (done) => {
    let testNum = "test_document_show_callback_007";
    try {
        let uri = "";
        let type = "";
        document.show(uri, type, (err) => {
        if (err) {
            console.info(`${testNum}::show err: ${err.message}`);
            expect(err.message == "error").assertTrue();
        } else {
            console.info(`${testNum}::show success`);
            expect(false).assertTrue();
        }
        done();
        });
    } catch (error) {
        console.info(`${testNum}::show error: ${error.message}`);
        expect(error.message == "error").assertTrue();
        done();
    }
    });

    /**
     * @tc.name   test_document_show_callback_008
     * @tc.number SUB_STORAGE_DOCUMENT_SHOW_CALLBACK_0800
     * @tc.desc   test show function with both null parameters and callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_document_show_callback_008", Level.LEVEL1, async (done) => {
    let testNum = "test_document_show_callback_008";
    try {
        let uri = null;
        let type = null;
        document.show(uri, type, (err) => {
        if (err) {
            console.info(`${testNum}::show err: ${err.message}`);
            expect(err.message == "error").assertTrue();
        } else {
            console.info(`${testNum}::show success`);
            expect(false).assertTrue();
        }
        done();
        });
    } catch (error) {
        console.info(`${testNum}::show error: ${error.message}`);
        expect(error.message == "error").assertTrue();
        done();
    }
    });

    /**
     * @tc.name   test_document_show_callback_009
     * @tc.number SUB_STORAGE_DOCUMENT_SHOW_CALLBACK_0900
     * @tc.desc   test show function with both undefined parameters and callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_document_show_callback_009", Level.LEVEL1, async (done) => {
    let testNum = "test_document_show_callback_009";
    try {
        let uri = undefined;
        let type = undefined;
        document.show(uri, type, (err) => {
        if (err) {
            console.info(`${testNum}::show err: ${JSON.stringify(err)}`);
            expect(err.message == "error").assertTrue();
        } else {
            console.info(`${testNum}::show success`);
            expect(false).assertTrue();
        }
        done();
        });
    } catch (error) {
        console.info(`${testNum}::show error: ${error.message}`);
        expect(error.message == "error").assertTrue();
        done();
    }
    });

    /**
     * @tc.name   test_document_show_promise_000
     * @tc.number SUB_STORAGE_DOCUMENT_SHOW_PROMISE_0000
     * @tc.desc   test show function with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_document_show_promise_000", Level.LEVEL1, async (done) => {
    let testNum = "test_document_show_promise_000";
    try {
        let uri = "file://docs/storage/Users/currentUser/test/test.txt";
        let type = "text/plain";
        await document.show(uri, type);
        done();
    } catch (error) {
        console.info(`${testNum}::show error: ${error.message}`);
        expect(error.message == "error").assertTrue();
        done();
    }
    });

    /**
     * @tc.name   test_document_show_promise_001
     * @tc.number SUB_STORAGE_DOCUMENT_SHOW_PROMISE_0100
     * @tc.desc   test show function with empty string uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_document_show_promise_001", Level.LEVEL1, async (done) => {
    let testNum = "test_document_show_promise_001";
    try {
        let uri = "";
        let type = "text/plain";
        await document.show(uri, type);
        expect(false).assertTrue();
        done();
    } catch (error) {
        console.info(`${testNum}::show error: ${error.message}`);
        expect(error.message == "error").assertTrue();
        done();
    }
    });

    /**
     * @tc.name   test_document_show_promise_002
     * @tc.number SUB_STORAGE_DOCUMENT_SHOW_PROMISE_0200
     * @tc.desc   test show function with null uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_document_show_promise_002", Level.LEVEL1, async (done) => {
    let testNum = "test_document_show_promise_002";
    try {
        let uri = null;
        let type = "text/plain";
        await document.show(uri, type);
        expect(false).assertTrue();
        done();
    } catch (error) {
        console.info(`${testNum}::show error: ${error.message}`);
        expect(error.message == "error").assertTrue();
        done();
    }
    });

    /**
     * @tc.name   test_document_show_promise_003
     * @tc.number SUB_STORAGE_DOCUMENT_SHOW_PROMISE_0300
     * @tc.desc   test show function with undefined uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_document_show_promise_003", Level.LEVEL1, async (done) => {
    let testNum = "test_document_show_promise_003";
    try {
        let uri = undefined;
        let type = "text/plain";
        await document.show(uri, type);
        expect(false).assertTrue();
        done();
    } catch (error) {
        console.info(`${testNum}::show error: ${error.message}`);
        expect(error.message == "error").assertTrue();
        done();
    }
    });

    /**
     * @tc.name   test_document_show_promise_004
     * @tc.number SUB_STORAGE_DOCUMENT_SHOW_PROMISE_0400
     * @tc.desc   test show function with empty string type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_document_show_promise_004", Level.LEVEL1, async (done) => {
    let testNum = "test_document_show_promise_004";
    try {
        let uri = "file://docs/storage/Users/currentUser/test/test.txt";
        let type = "";
        await document.show(uri, type);
        expect(false).assertTrue();
        done();
    } catch (error) {
        console.info(`${testNum}::show error: ${error.message}`);
        expect(error.message == "error").assertTrue();
        done();
    }
    });

    /**
     * @tc.name   test_document_show_promise_005
     * @tc.number SUB_STORAGE_DOCUMENT_SHOW_PROMISE_0500
     * @tc.desc   test show function with null type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_document_show_promise_005", Level.LEVEL1, async (done) => {
    let testNum = "test_document_show_promise_005";
    try {
        let uri = "file://docs/storage/Users/currentUser/test/test.txt";
        let type = null;
        await document.show(uri, type);
        expect(false).assertTrue();
        done();
    } catch (error) {
        console.info(`${testNum}::show error: ${error.message}`);
        expect(error.message == "error").assertTrue();
        done();
    }
    });

    /**
     * @tc.name   test_document_show_promise_006
     * @tc.number SUB_STORAGE_DOCUMENT_SHOW_PROMISE_0600
     * @tc.desc   test show function with undefined type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_document_show_promise_006", Level.LEVEL1, async (done) => {
    let testNum = "test_document_show_promise_006";
    try {
        let uri = "file://docs/storage/Users/currentUser/test/test.txt";
        let type = undefined;
        await document.show(uri, type);
        expect(false).assertTrue();
        done();
    } catch (error) {
        console.info(`${testNum}::show error: ${error.message}`);
        expect(error.message == "error").assertTrue();
        done();
    }
    });

    /**
     * @tc.name   test_document_show_promise_007
     * @tc.number SUB_STORAGE_DOCUMENT_SHOW_PROMISE_0700
     * @tc.desc   test show function with both empty string parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_document_show_promise_007", Level.LEVEL1, async (done) => {
    let testNum = "test_document_show_promise_007";
    try {
        let uri = "";
        let type = "";
        await document.show(uri, type);
        expect(false).assertTrue();
        done();
    } catch (error) {
        console.info(`${testNum}::show error: ${error.message}`);
        expect(error.message == "error").assertTrue();
        done();
    }
    });

    /**
     * @tc.name   test_document_show_promise_008
     * @tc.number SUB_STORAGE_DOCUMENT_SHOW_PROMISE_0800
     * @tc.desc   test show function with both null parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_document_show_promise_008", Level.LEVEL1, async (done) => {
    let testNum = "test_document_show_promise_008";
    try {
        let uri = null;
        let type = null;
        await document.show(uri, type);
        expect(false).assertTrue();
        done();
    } catch (error) {
        console.info(`${testNum}::show error: ${error.message}`);
        expect(error.message == "error").assertTrue();
        done();
    }
    });

    /**
     * @tc.name   test_document_show_promise_009
     * @tc.number SUB_STORAGE_DOCUMENT_SHOW_PROMISE_0900
     * @tc.desc   test show function with both undefined parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_document_show_promise_009", Level.LEVEL1, async (done) => {
    let testNum = "test_document_show_promise_009";
    try {
        let uri = undefined;
        let type = undefined;
        await document.show(uri, type);
        expect(false).assertTrue();
        done();
    } catch (error) {
        console.info(`${testNum}::show error: ${error.message}`);
        expect(error.message == "error").assertTrue();
        done();
    }
    });
});
}