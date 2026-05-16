/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
 	 
#include "Matrix4Test.h"
#include "../manager/PluginManagerTest.h"
#include <string>
#include <arkui/drag_and_drop.h>
#include <arkui/native_dialog.h>
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_interface.h>
#include <arkui/native_node.h>
#include <arkui/ui_input_event.h>
#include <cstddef>
#include <cstdint>
#include <hilog/log.h>

namespace ArkUICapiTest {

static ArkUI_AttributeItem item1;
static ArkUI_Matrix4* matrix1;
static ArkUI_Matrix4* matrix2;
static ArkUI_Matrix4* matrix3;
static ArkUI_Matrix4* matrix4;
static ArkUI_Matrix4* matrix5;
static ArkUI_Matrix4* matrix6;
static ArkUI_Matrix4* matrix7;
static ArkUI_Matrix4* matrix8;
static ArkUI_NodeHandle image2;
static ArkUI_NodeHandle textMatrix;
static float x = PARAM_0;
static float y = PARAM_0;
static float z = PARAM_0;
static float centerX = PARAM_0;
static float centerY = PARAM_0;
static float angle = PARAM_0;
static char g_logBuffer[SIZE_256] = {PARAM_0};
static float result[PARAM_16] = {
	1.0f, 0.0f, 0.0f, 0.0f,
	0.0f, 1.0f, 0.0f, 0.0f,
	0.0f, 0.0f, 1.0f, 0.0f,
    0.0f, 0.0f, 0.0f, 1.0f
};

static int case0 = PARAM_0;
static int case1 = PARAM_1;
static int case2 = PARAM_2;
static int case3 = PARAM_3;
static int case4 = PARAM_4;
static int case5 = PARAM_5;
static int case6 = PARAM_6;
static int case7 = PARAM_7;
static int case8 = PARAM_8;
static int case9 = PARAM_9;
static int case10 = PARAM_10;
static int case11 = PARAM_11;
static int case12 = PARAM_12;
static int case13 = PARAM_13;
static int case14 = PARAM_14;
static int case15 = PARAM_15;

static ArkUI_NodeHandle SetButtonNode(std::string id, int32_t targetId)
{
	float mMargin = PARAM_5;
	ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
		OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
	ArkUI_AttributeItem idValue;
	idValue.string = id.c_str();
	auto node = nodeAPI->createNode(ARKUI_NODE_BUTTON);
	nodeAPI->setAttribute(node, NODE_BUTTON_LABEL, &idValue);
	nodeAPI->setAttribute(node, NODE_ID, &idValue);
	ArkUI_NumberValue value_layout[] = {{.u32 = PARAM_1}};
	ArkUI_AttributeItem item_layout = {value_layout, sizeof(value_layout)/ sizeof(ArkUI_NumberValue)};
	ArkUI_NumberValue margin[] = {mMargin};
	ArkUI_AttributeItem item_margin = {margin, sizeof(margin) / sizeof(ArkUI_NumberValue)};

	nodeAPI->setAttribute(node, NODE_MARGIN, &item_margin);
	nodeAPI->setAttribute(node, NODE_LAYOUT_WEIGHT, &item_layout);

	nodeAPI->registerNodeEvent(node, NODE_ON_CLICK, targetId, nullptr);
	return node;
}
static ArkUI_NodeHandle SetTextNode(std::string id)
{
	ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
		OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
	ArkUI_AttributeItem idValue;
	idValue.string = id.c_str();
	auto node = nodeAPI->createNode(ARKUI_NODE_TEXT);
	nodeAPI->setAttribute(node, NODE_TEXT_CONTENT, &idValue);
	nodeAPI->setAttribute(node, NODE_ID, &idValue);
	return node;
}

static void SetMatrixSkew(){
	float skewY = PARAM_1_POINT_5;
	ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
		OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
	matrix1 = OH_ArkUI_Matrix4_CreateIdentity();
	ArkUI_ErrorCode code = OH_ArkUI_Matrix4_Skew(matrix1, PARAM_1, skewY);
	OH_ArkUI_Matrix4_GetElements(matrix1, result);
	if (code == ARKUI_ERROR_CODE_NO_ERROR) {
		item1 = {.size = PARAM_0, .object = matrix1};
		snprintf(g_logBuffer, sizeof(g_logBuffer), "%f", result[PARAM_1]);
		ArkUI_AttributeItem logMsg = {.string = g_logBuffer};
		nodeAPI->setAttribute(textMatrix, NODE_TEXT_CONTENT, &logMsg);
	}
}

static void SetMatrixTranslate()
{
	float setX = PARAM_50_POINT_5;
	float setY = PARAM_NEGATIVE_20;
	float setZ = PARAM_2;
	ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
		OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
	matrix2 = OH_ArkUI_Matrix4_CreateIdentity();
	auto translate = OH_ArkUI_Matrix4TranslationOptions_Create();
	ArkUI_ErrorCode code1 = OH_ArkUI_Matrix4TranslationOptions_SetX(translate, setX);
	ArkUI_ErrorCode code2 = OH_ArkUI_Matrix4TranslationOptions_SetY(translate, setY);
	ArkUI_ErrorCode code3 = OH_ArkUI_Matrix4TranslationOptions_SetZ(translate, setZ);
	ArkUI_ErrorCode code4 = OH_ArkUI_Matrix4_Translate(matrix2, translate);
	if (code1 == ARKUI_ERROR_CODE_NO_ERROR && code2 == ARKUI_ERROR_CODE_NO_ERROR &&
		code3 == ARKUI_ERROR_CODE_NO_ERROR && code4 == ARKUI_ERROR_CODE_NO_ERROR) {
			item1 = {.size = PARAM_0, .object = matrix2};
	}
	ArkUI_ErrorCode code5 = OH_ArkUI_Matrix4TranslationOptions_GetX(translate, &x);
	ArkUI_ErrorCode code6 = OH_ArkUI_Matrix4TranslationOptions_GetY(translate, &y);
	ArkUI_ErrorCode code7 = OH_ArkUI_Matrix4TranslationOptions_GetZ(translate, &z);
	if (code5 == ARKUI_ERROR_CODE_NO_ERROR && code6 == ARKUI_ERROR_CODE_NO_ERROR &&
		code7 == ARKUI_ERROR_CODE_NO_ERROR) {
			snprintf(g_logBuffer, sizeof(g_logBuffer), "%f,%f,%f", x, y, z);
			ArkUI_AttributeItem logMsg = {.string = g_logBuffer};
			nodeAPI->setAttribute(textMatrix, NODE_TEXT_CONTENT, &logMsg);
	}
}

static void SetMatrixScale()
{
	float setX = PARAM_2;
	float setY = PARAM_NEGATIVE_0_POINT_5;
	float setZ = PARAM_2;
	float setCenterX = PARAM_10;
	float setCenterY = PARAM_5_POINT_5;
	ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
		OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
	matrix3 = OH_ArkUI_Matrix4_CreateIdentity();
	auto scale = OH_ArkUI_Matrix4ScaleOptions_Create();
	ArkUI_ErrorCode code1 = OH_ArkUI_Matrix4ScaleOptions_SetX(scale, setX);
	ArkUI_ErrorCode code2 = OH_ArkUI_Matrix4ScaleOptions_SetY(scale, setY);
	ArkUI_ErrorCode code3 = OH_ArkUI_Matrix4ScaleOptions_SetZ(scale, setZ);
	ArkUI_ErrorCode code4 = OH_ArkUI_Matrix4ScaleOptions_SetCenterX(scale, setCenterX);
	ArkUI_ErrorCode code5 = OH_ArkUI_Matrix4ScaleOptions_SetCenterY(scale, setCenterY);
	ArkUI_ErrorCode code6 = OH_ArkUI_Matrix4_Scale(matrix3, scale);
	if (code1 == ARKUI_ERROR_CODE_NO_ERROR && code2 == ARKUI_ERROR_CODE_NO_ERROR &&
		code3 == ARKUI_ERROR_CODE_NO_ERROR && code4 == ARKUI_ERROR_CODE_NO_ERROR &&
		code5 == ARKUI_ERROR_CODE_NO_ERROR && code6 == ARKUI_ERROR_CODE_NO_ERROR) {
			item1 = {.size = PARAM_0, .object = matrix3};
	}
	ArkUI_ErrorCode code7 = OH_ArkUI_Matrix4ScaleOptions_GetX(scale, &x);
	ArkUI_ErrorCode code8 = OH_ArkUI_Matrix4ScaleOptions_GetY(scale, &y);
	ArkUI_ErrorCode code9 = OH_ArkUI_Matrix4ScaleOptions_GetZ(scale, &z);
	ArkUI_ErrorCode code10 = OH_ArkUI_Matrix4ScaleOptions_GetCenterX(scale, &centerX);
	ArkUI_ErrorCode code11 = OH_ArkUI_Matrix4ScaleOptions_GetCenterY(scale, &centerY);
	if (code7 == ARKUI_ERROR_CODE_NO_ERROR && code8 == ARKUI_ERROR_CODE_NO_ERROR &&
		code9 == ARKUI_ERROR_CODE_NO_ERROR && code10 == ARKUI_ERROR_CODE_NO_ERROR &&
		code11 == ARKUI_ERROR_CODE_NO_ERROR) {
			snprintf(g_logBuffer, sizeof(g_logBuffer), "%f,%f,%f,%f,%f", x, y, z, centerX, centerY);
			ArkUI_AttributeItem logMsg = {.string = g_logBuffer};
			nodeAPI->setAttribute(textMatrix, NODE_TEXT_CONTENT, &logMsg);
	}
}

static void SetMatrixRotate()
{
	float setX = PARAM_2_POINT_5;
	float setY = PARAM_NEGATIVE_3;
	float setZ = PARAM_1;
	float setCenterX = PARAM_5_POINT_5;
	float setCenterY = PARAM_13;
	float setAngle = SIZE_60;
	ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
		OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
	matrix4 = OH_ArkUI_Matrix4_CreateIdentity();
	auto rotate = OH_ArkUI_Matrix4RotationOptions_Create();
	ArkUI_ErrorCode code1 = OH_ArkUI_Matrix4RotationOptions_SetX(rotate, setX);
	ArkUI_ErrorCode code2 = OH_ArkUI_Matrix4RotationOptions_SetY(rotate, setY);
	ArkUI_ErrorCode code3 = OH_ArkUI_Matrix4RotationOptions_SetZ(rotate, setZ);
	ArkUI_ErrorCode code4 = OH_ArkUI_Matrix4RotationOptions_SetCenterX(rotate, setCenterX);
	ArkUI_ErrorCode code5 = OH_ArkUI_Matrix4RotationOptions_SetCenterY(rotate, setCenterY);
	ArkUI_ErrorCode code6 = OH_ArkUI_Matrix4RotationOptions_SetAngle(rotate, setAngle);
	ArkUI_ErrorCode code7 = OH_ArkUI_Matrix4_Rotate(matrix4, rotate);
	if (code1 == ARKUI_ERROR_CODE_NO_ERROR && code2 == ARKUI_ERROR_CODE_NO_ERROR &&
		code3 == ARKUI_ERROR_CODE_NO_ERROR && code4 == ARKUI_ERROR_CODE_NO_ERROR &&
		code5 == ARKUI_ERROR_CODE_NO_ERROR && code6 == ARKUI_ERROR_CODE_NO_ERROR &&
		code7 == ARKUI_ERROR_CODE_NO_ERROR) {
			item1 = {.size = PARAM_0, .object = matrix4};
	}
	ArkUI_ErrorCode code8 = OH_ArkUI_Matrix4RotationOptions_GetX(rotate, &x);
	ArkUI_ErrorCode code9 = OH_ArkUI_Matrix4RotationOptions_GetY(rotate, &y);
	ArkUI_ErrorCode code10 = OH_ArkUI_Matrix4RotationOptions_GetZ(rotate, &z);
	ArkUI_ErrorCode code11 = OH_ArkUI_Matrix4RotationOptions_GetCenterX(rotate, &centerX);
	ArkUI_ErrorCode code12 = OH_ArkUI_Matrix4RotationOptions_GetCenterY(rotate, &centerY);
	ArkUI_ErrorCode code13 = OH_ArkUI_Matrix4RotationOptions_GetAngle(rotate, &angle);
	if (code8 == ARKUI_ERROR_CODE_NO_ERROR && code9 == ARKUI_ERROR_CODE_NO_ERROR &&
		code10 == ARKUI_ERROR_CODE_NO_ERROR && code11 == ARKUI_ERROR_CODE_NO_ERROR &&
		code12 == ARKUI_ERROR_CODE_NO_ERROR && code13 == ARKUI_ERROR_CODE_NO_ERROR) {
			snprintf(g_logBuffer, sizeof(g_logBuffer), "%f,%f,%f,%f,%f,%f", x, y, z, centerX, centerY, angle);
			ArkUI_AttributeItem logMsg = {.string = g_logBuffer};
			nodeAPI->setAttribute(textMatrix, NODE_TEXT_CONTENT, &logMsg);
	}
}

static void SetMatrixCombine()
{
	float result0[PARAM_16] = {
		0.5f, 0.0f, 0.0f, 0.0f,
		0.0f, 2.0f, 0.0f, 0.0f,
		0.0f, 0.0f, 1.0f, 0.0f,
		50.0f, 80.0f, 60.0f, 1.0f
	};
	float result1[PARAM_16] = {
		1.0f, 0.0f, 0.0f, 0.0f,
		0.0f, 1.0f, 0.0f, 0.0f,
		0.0f, 0.0f, 2.0f, 0.0f,
		5.0f, -30.0f, 0.0f, 1.0f
	};
	ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
		OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
		matrix5 = OH_ArkUI_Matrix4_CreateByElements(result0);
		auto matrix05 = OH_ArkUI_Matrix4_CreateByElements(result1);
		ArkUI_ErrorCode code = OH_ArkUI_Matrix4_Combine(matrix5, matrix05);
		OH_ArkUI_Matrix4_GetElements(matrix5, result);
		if (code == ARKUI_ERROR_CODE_NO_ERROR) {
			item1 = {.size = PARAM_0, .object = matrix5};
			snprintf(g_logBuffer, sizeof(g_logBuffer), "%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f",
				result[case0], result[case1],result[case2], result[case3], result[case4], result[case5],
				result[case6], result[case7], result[case8], result[case9], result[case10],
				result[case11], result[case12], result[case13], result[case14], result[case15]);
			ArkUI_AttributeItem logMsg = {.string = g_logBuffer};
			nodeAPI->setAttribute(textMatrix, NODE_TEXT_CONTENT, &logMsg);
		}
}

static void SetMatrixDispose()
{
	auto matrix = OH_ArkUI_Matrix4_CreateIdentity();
	OH_ArkUI_Matrix4_Dispose(matrix);
	auto option1 = OH_ArkUI_Matrix4TranslationOptions_Create();
	OH_ArkUI_Matrix4TranslationOptions_Dispose(option1);
	auto option2 = OH_ArkUI_Matrix4ScaleOptions_Create();
	OH_ArkUI_Matrix4ScaleOptions_Dispose(option2);
	auto option3 = OH_ArkUI_Matrix4RotationOptions_Create();
	OH_ArkUI_Matrix4RotationOptions_Dispose(option3);
	matrix = nullptr;
}

static void SetMatrixInvert()
{
	ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
		OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
	matrix6 = OH_ArkUI_Matrix4_Copy(matrix5);
	ArkUI_ErrorCode code = OH_ArkUI_Matrix4_Invert(matrix6);
	OH_ArkUI_Matrix4_GetElements(matrix6, result);
	if (code == ARKUI_ERROR_CODE_NO_ERROR) {
		item1 = {.size = PARAM_0, .object = matrix6};
		snprintf(g_logBuffer, sizeof(g_logBuffer), "%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f",
			result[case0], result[case1],result[case2], result[case3], result[case4], result[case5],
			result[case6], result[case7], result[case8], result[case9], result[case10],
			result[case11], result[case12], result[case13], result[case14], result[case15]);
		ArkUI_AttributeItem logMsg = {.string = g_logBuffer};
		nodeAPI->setAttribute(textMatrix, NODE_TEXT_CONTENT, &logMsg);
	}
}

static void SetMatrixTransformPoint()
{
	float setX = SIZE_150;
	float setY = PARAM_NEGATIVE_50;
	ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
		OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
	matrix7 = OH_ArkUI_Matrix4_CreateIdentity();
	ArkUI_PointF originPoint = {SIZE_50, SIZE_50};
	ArkUI_PointF resultPoint = {PARAM_0, PARAM_0};
	auto matrix01 = OH_ArkUI_Matrix4_CreateIdentity();
	auto translate01 = OH_ArkUI_Matrix4TranslationOptions_Create();
	OH_ArkUI_Matrix4TranslationOptions_SetX(translate01, setX);
	OH_ArkUI_Matrix4TranslationOptions_SetY(translate01, setY);
	OH_ArkUI_Matrix4_Translate(matrix01, translate01);
	ArkUI_ErrorCode code = OH_ArkUI_Matrix4_TransformPoint(matrix01, &originPoint, &resultPoint);
	auto translate1 = OH_ArkUI_Matrix4TranslationOptions_Create();
	OH_ArkUI_Matrix4TranslationOptions_SetX(translate1, resultPoint.x);
	OH_ArkUI_Matrix4TranslationOptions_SetY(translate1, resultPoint.y);
	OH_ArkUI_Matrix4_Translate(matrix7, translate1);
	OH_ArkUI_Matrix4_GetElements(matrix7, result);
	if (code == ARKUI_ERROR_CODE_NO_ERROR) {
		item1 = {.size = PARAM_0, .object = matrix7};
		snprintf(g_logBuffer, sizeof(g_logBuffer), "%f,%f", result[case12], result[case13]);
		ArkUI_AttributeItem logMsg = {.string = g_logBuffer};
		nodeAPI->setAttribute(textMatrix, NODE_TEXT_CONTENT, &logMsg);
	}
}

static void SetMatrixPolyToPoly()
{
	uint32_t point = PARAM_4;
	ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
		OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
	matrix8 = OH_ArkUI_Matrix4_CreateIdentity();
	ArkUI_PointF src2[PARAM_4] = {{PARAM_0, PARAM_0}, {PARAM_100, PARAM_0}, {PARAM_0, PARAM_100}, {PARAM_100, PARAM_100}};
	ArkUI_PointF dst2[PARAM_4] = {{SIZE_50, PARAM_0}, {SIZE_150, PARAM_0}, {SIZE_50, PARAM_100}, {SIZE_150, PARAM_100}};
	ArkUI_ErrorCode code = OH_ArkUI_Matrix4_SetPolyToPoly(matrix8, src2, dst2, point);
	OH_ArkUI_Matrix4_GetElements(matrix8, result);
	if (code == ARKUI_ERROR_CODE_NO_ERROR) {
		item1 = {.size = PARAM_0, .object = matrix8};
		snprintf(g_logBuffer, sizeof(g_logBuffer), "%f", result[case12]);
		ArkUI_AttributeItem logMsg = {.string = g_logBuffer};
		nodeAPI->setAttribute(textMatrix, NODE_TEXT_CONTENT, &logMsg);
	}
}

static void OnEventReceive(ArkUI_NodeEvent *event)
{
	ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
		OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
	auto eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
	if (eventId == case1) {
		SetMatrixSkew();
		nodeAPI->setAttribute(image2, NODE_TRANSFORM, &item1);
	} else if (eventId == case2) {
		SetMatrixTranslate();
		nodeAPI->setAttribute(image2, NODE_TRANSFORM, &item1);
	} else if (eventId == case3) {
		SetMatrixScale();
		nodeAPI->setAttribute(image2, NODE_TRANSFORM, &item1);
	} else if (eventId == case4) {
		SetMatrixRotate();
		nodeAPI->setAttribute(image2, NODE_TRANSFORM, &item1);
	} else if (eventId == case5) {
		SetMatrixCombine();
		nodeAPI->setAttribute(image2, NODE_TRANSFORM, &item1);
	} else if (eventId == case6) {
		SetMatrixInvert();
		nodeAPI->setAttribute(image2, NODE_TRANSFORM, &item1);
	} else if (eventId == case7) {
		SetMatrixTransformPoint();
		nodeAPI->setAttribute(image2, NODE_TRANSFORM, &item1);
	} else if (eventId == case8) {
		SetMatrixPolyToPoly();
		nodeAPI->setAttribute(image2, NODE_TRANSFORM, &item1);
	}
}

napi_value Matrix4Test::CreateNativeNode(napi_env env, napi_callback_info info)
{
	size_t argc = PARAM_1;
	float mHeight = PARAM_100;
	napi_value args[PARAM_1] = {nullptr};
	napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
	size_t length = PARAM_64;
	size_t strLength = PARAM_0;
	char xComponentID[PARAM_64] = {PARAM_0};
	napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
	if ((env == nullptr) || (info == nullptr)) {
		return nullptr;
	}

	ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
		OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
	ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
	char src[] = "resources/base/media/icon.png";
	ArkUI_AttributeItem imageItem = {.string = src};
	ArkUI_NumberValue nodeHeightValue[] = {mHeight};
	ArkUI_AttributeItem nodeHeightItem = {nodeHeightValue, 1};

	image2 = nodeAPI->createNode(ARKUI_NODE_IMAGE);
	nodeAPI->setAttribute(image2, NODE_IMAGE_SRC, &imageItem);
	nodeAPI->setAttribute(image2, NODE_HEIGHT, &nodeHeightItem);

	ArkUI_NodeHandle row1 = nodeAPI->createNode(ARKUI_NODE_ROW);
	ArkUI_NodeHandle row2 = nodeAPI->createNode(ARKUI_NODE_ROW);
	nodeAPI->addChild(column, row1);
	nodeAPI->addChild(column, row2);

	nodeAPI->addChild(row1, SetButtonNode("1", case1));
	nodeAPI->addChild(row1, SetButtonNode("2", case2));
	nodeAPI->addChild(row1, SetButtonNode("3", case3));
	nodeAPI->addChild(row1, SetButtonNode("4", case4));
	nodeAPI->addChild(row2, SetButtonNode("5", case5));
	nodeAPI->addChild(row2, SetButtonNode("6", case6));
	nodeAPI->addChild(row2, SetButtonNode("7", case7));
	nodeAPI->addChild(row2, SetButtonNode("8", case8));
	textMatrix = SetTextNode("testMatrix");
	nodeAPI->addChild(column, textMatrix);
	nodeAPI->addChild(column, image2);
	nodeAPI->registerNodeEventReceiver(&OnEventReceive);
	SetMatrixDispose();

	std::string id(xComponentID);
	OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column);
	napi_value exports;
	if (napi_create_object(env, &exports) != napi_ok) {
		napi_throw_type_error(env, nullptr, "napi_create_object failed");
	return nullptr;
	}
	return exports;
}
}