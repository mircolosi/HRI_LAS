/*
 * Main node for hri_pnp
 */

#include "HRIPNPAS.h"

int main(int argc, char** argv)
{
    ros::init(argc, argv, "hri_pnpas");

    ros::NodeHandle node;
    
    HRIPNPActionServer hripnpas(node);
    hripnpas.start();
    ros::spin();

    return 0;
}

