/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <sys/queue.h>
#include "functionalext.h"
#include "test.h"

#define NODE_TEN 10
#define NODE_TWENTY 20
#define NODE_THIRTY 30

// 定义链表节点结构
struct Node {
    int data;
    LIST_ENTRY(Node) entries;
};

// 定义链表头结构
LIST_HEAD(Head, Node) g_head = LIST_HEAD_INITIALIZER(g_head);

// 插入节点到链表
void InsertNode(int data)
{
    struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
    EXPECT_PTRNE("InsertNode", newNode, nullptr);
    newNode->data = data;
    LIST_INSERT_HEAD(&g_head, newNode, entries);
}

// 删除节点
void DeleteNode(int data)
{
    struct Node* node;
    LIST_FOREACH(node, &g_head, entries)
    {
        if (node->data == data) {
            LIST_REMOVE(node, entries);
            free(node);
            return;
        }
    }
}

// 遍历链表并返回所有节点值的字符串
void TraverseList(char* result, size_t resultLen)
{
    struct Node* node;
    char buffer[20];
    size_t pos = 0;
    LIST_FOREACH(node, &g_head, entries)
    {
        int res = std::snprintf(buffer, sizeof(buffer), "%d ", node->data);
        EXPECT_GTE("TraverseList -> snprintf", res, 0);
        size_t len = strlen(buffer);
        if (pos + len < resultLen) {
            (void)std::snprintf(result + pos, resultLen - pos, "%s", buffer);
            pos += len;
        }
    }
}

// C 测试用例
void Slist0100()
{
    char result[100];

    // 插入节点到链表
    InsertNode(NODE_TEN);
    InsertNode(NODE_TWENTY);
    InsertNode(NODE_THIRTY);

    // 验证链表内容是否符合预期
    TraverseList(result, sizeof(result));
    EXPECT_STREQ("Slist0100", result, "30 20 10 ");

    // 删除节点并验证链表内容
    DeleteNode(NODE_TWENTY);
    TraverseList(result, sizeof(result));
    EXPECT_STREQ("Slist0100", result, "30 10 ");
}

static int SysQueueTestImpl()
{
    Slist0100();
    return T_STATUS;
}

int SysQueueTest(void)
{
    return SysQueueTestImpl();
}
