/*
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#include <climits>
#include <gtest/gtest.h>
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310019TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018313,
        "dEQP-GLES31.functional.debug.state_que",
        "ry.max_debug_message_length_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018314,
        "dEQP-GLES31.functional.debug.state_que",
        "ry.max_debug_message_length_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018315,
        "dEQP-GLES31.functional.debug.state_quer",
        "y.max_debug_message_length_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018316,
        "dEQP-GLES31.functional.debug.state_qu",
        "ery.max_debug_message_length_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018317,
        "dEQP-GLES31.functional.debug.state_que",
        "ry.max_debug_logged_messages_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018318,
        "dEQP-GLES31.functional.debug.state_que",
        "ry.max_debug_logged_messages_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018319,
        "dEQP-GLES31.functional.debug.state_quer",
        "y.max_debug_logged_messages_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018320,
        "dEQP-GLES31.functional.debug.state_qu",
        "ery.max_debug_logged_messages_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018321,
        "dEQP-GLES31.functional.debug.state_quer",
        "y.max_debug_group_stack_depth_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018322,
        "dEQP-GLES31.functional.debug.state_quer",
        "y.max_debug_group_stack_depth_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018323,
        "dEQP-GLES31.functional.debug.state_query",
        ".max_debug_group_stack_depth_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018324,
        "dEQP-GLES31.functional.debug.state_que",
        "ry.max_debug_group_stack_depth_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018325,
        "dEQP-GLES31.functional.debug.state",
        "_query.max_label_length_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018326,
        "dEQP-GLES31.functional.debug.state",
        "_query.max_label_length_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018327,
        "dEQP-GLES31.functional.debug.state_",
        "query.max_label_length_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018328,
        "dEQP-GLES31.functional.debug.stat",
        "e_query.max_label_length_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018329,
        "dEQP-GLES31.functional.debug.st",
        "ate_query.debug_output_isenabled");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018330,
        "dEQP-GLES31.functional.debug.sta",
        "te_query.debug_output_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018331,
        "dEQP-GLES31.functional.debug.sta",
        "te_query.debug_output_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018332,
        "dEQP-GLES31.functional.debug.stat",
        "e_query.debug_output_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018333,
        "dEQP-GLES31.functional.debug.st",
        "ate_query.debug_output_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018334,
        "dEQP-GLES31.functional.debug.state_qu",
        "ery.debug_output_synchronous_isenabled");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018335,
        "dEQP-GLES31.functional.debug.state_que",
        "ry.debug_output_synchronous_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018336,
        "dEQP-GLES31.functional.debug.state_que",
        "ry.debug_output_synchronous_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018337,
        "dEQP-GLES31.functional.debug.state_quer",
        "y.debug_output_synchronous_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018338,
        "dEQP-GLES31.functional.debug.state_qu",
        "ery.debug_output_synchronous_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018339,
        "dEQP-GLES31.functional.debug.state_q",
        "uery.debug_logged_messages_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018340,
        "dEQP-GLES31.functional.debug.state_q",
        "uery.debug_logged_messages_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018341,
        "dEQP-GLES31.functional.debug.state_qu",
        "ery.debug_logged_messages_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018342,
        "dEQP-GLES31.functional.debug.state_",
        "query.debug_logged_messages_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018343,
        "dEQP-GLES31.functional.debug.state_query.d",
        "ebug_next_logged_message_length_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018344,
        "dEQP-GLES31.functional.debug.state_query.d",
        "ebug_next_logged_message_length_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018345,
        "dEQP-GLES31.functional.debug.state_query.de",
        "bug_next_logged_message_length_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018346,
        "dEQP-GLES31.functional.debug.state_query.",
        "debug_next_logged_message_length_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018347,
        "dEQP-GLES31.functional.debug.state_qu",
        "ery.debug_group_stack_depth_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018348,
        "dEQP-GLES31.functional.debug.state_qu",
        "ery.debug_group_stack_depth_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018349,
        "dEQP-GLES31.functional.debug.state_que",
        "ry.debug_group_stack_depth_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018350,
        "dEQP-GLES31.functional.debug.state_q",
        "uery.debug_group_stack_depth_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018351,
        "dEQP-GLES31.functional.debug.state_qu",
        "ery.debug_callback_function_getpointer");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018352,
        "dEQP-GLES31.functional.debug.state_que",
        "ry.debug_callback_user_param_getpointer");
