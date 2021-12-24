using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using Bright.Serialization;
using UnityEngine;
using SimpleJSON;

namespace GameLogic
{
    public class Main : MonoBehaviour
    {
        void Start()
        {
            Debug.LogFormat("item[1].name:{0}", TableManager.Tables.TbItem.Get(10000).Name);

            TableManager.Tables.TranslateText((key, text) => text + "# translate");
        }
    }
}
