/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

// commit: 19e35c500bd2b5e6146e42705ab9b69c155a2006 2011-02-17
// commit: 187fe29d5b89644b68cade75a34257a1c32a75f6 2011-02-17
// non-standard musl specific behaviour
// Daemon should not fork in case of failure of chdir or open, but
// since setsid and fork may still fail after fork this behaviour
// is not very useful
#include <cerrno>
#include <cstring>
#include <fcntl.h>
#include <sys/wait.h>
#include <unistd.h>
#include "test.h"

static int DaemonFailureChild(int fdout, int* fd, int oldPid)
{
    int r;

    TFdfill();
    errno = 0;
    r = daemon(0, 0);
    if (dup2(fdout, 1) == -1) {
        constexpr ssize_t kDaemonErrorMsgLen = 7;
        write(fdout, "ERROR:\n", kDaemonErrorMsgLen);
        t_error("failed to dup pipe fd for communicating results: %s\n", strerror(errno));
    }
    if (r != -1) {
        t_error("daemon should have failed\n");
    }
    if (errno != EMFILE) {
        t_error("daemon should have failed with %d [EMFILE] got %d [%s]\n", EMFILE, errno, strerror(errno));
    }
    if (getpid() != oldPid || getppid() == 1) {
        t_error("daemon forked despite failure: ppid is %d, pid is %d, old pid is %d\n", getppid(), getpid(), oldPid);
    }
    if (write(fd[1], "1" + !T_STATUS, 1) != 1) {
        t_error("write failed: %s\n", strerror(errno));
    }
    return T_STATUS;
}

static void DaemonFailureParentCheck(int childPid, int fd0, int fd1)
{
    int r;
    int s;
    char c;

    close(fd1);
    if (waitpid(childPid, &s, 0) != childPid) {
        t_error("waitpid failed: %s\n", strerror(errno));
    } else if (!WIFEXITED(s)) {
        t_error("child exited abnormally (signal %d)\n", WIFSIGNALED(s) ? WTERMSIG(s) : 0);
    } else if (WEXITSTATUS(s)) {
        t_error("child exited with %d\n", WEXITSTATUS(s));
    }
    r = read(fd0, &c, 1);
    if (r == -1) {
        t_error("read failed: %s\n", strerror(errno));
    } else if (r == 0) {
        t_error("read failed: child did not send its exit status\n");
    } else if (c != 0) {
        t_error("child failed\n");
    }
}

int DaemonFailureTest(void)
{
    int r;
    int pid;
    int fd[2];
    int fdout;

    r = pipe(fd);
    if (r == -1) {
        t_error("pipe failed: %s\n", strerror(errno));
        return 1;
    }
    fdout = dup(1);
    if (fdout == -1) {
        t_error("dup(1) failed: %s\n", strerror(errno));
        close(fd[0]);
        close(fd[1]);
        return 1;
    }
    r = fork();
    if (r == -1) {
        t_error("fork failed: %s\n", strerror(errno));
        close(fdout);
        close(fd[0]);
        close(fd[1]);
        return 1;
    }
    if (r == 0) {
        pid = getpid();
        return DaemonFailureChild(fdout, fd, pid);
    }
    DaemonFailureParentCheck(r, fd[0], fd[1]);
    close(fdout);
    close(fd[0]);

    return T_STATUS;
}
