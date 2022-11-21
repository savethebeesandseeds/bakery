#include "server_piaabo.hpp"
#include "stdio.h"

int main(int argc, char *argv[]){
  struct MHD_Daemon *daemon;
  daemon = MHD_start_daemon (
    MHD_USE_THREAD_PER_CONNECTION, PORT, 
    on_client_connect, NULL,
    &answer_to_connection, NULL, 
    MHD_OPTION_CONNECTION_TIMEOUT, (unsigned int) 15,
    MHD_OPTION_NOTIFY_COMPLETED, &on_request_completed, NULL,
    MHD_OPTION_END);

  if (NULL == daemon){
    fprintf(stderr,"Unable to start MHD.\n");
    return 1;
  }

  fprintf(stdout,"[Running server...]\n");
  getchar();

  MHD_stop_daemon(daemon);

  return 0;
}