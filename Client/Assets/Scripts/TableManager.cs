using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using Bright.Serialization;
using cfg;
using UnityEngine;
using SimpleJSON;

namespace GameLogic
{
    public class TableManager
    {
        private static Tables m_Tables;
        public static Tables Tables
        {
            get
            {
                if(m_Tables == null)
                    m_Tables = new cfg.Tables(LoadByteBuf);
                return m_Tables;
            }
        }

        private static JSONNode LoadByteBuf(string file)
        {
            return JSON.Parse(File.ReadAllText(Application.dataPath + "/TableData/Json/" + file + ".json", System.Text.Encoding.UTF8));
        }
    }
}